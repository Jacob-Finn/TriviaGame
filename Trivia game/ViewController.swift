
import UIKit

class ViewController: UIViewController {
    //-------- --------- Variables --------- ----------//
    
    var buttonOneCorrect = false    // these will allow us to associate a bool value with the buttons so we know
    var buttonTwoCorrect = false    // which one of the buttons is correct. These bools are set by
    var buttonThreeCorrect = false // the answer that is assigned to them.
    var buttonFourCorrect = false
    var userStats = UserStats.init(selectionIndex: 0, userScore: 0)
    
    //-------- --------- --------- --------- ----------//
    
    
    //-------- --------- StoryBoard --------- ----------//
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    var questionLabelText: String = "" {
        didSet {
            questionLabel.text = questionLabelText
        }
    }
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    //-------- --------- --------- --------- ----------//
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let questionSetArray = DataManager.loadQuestionArray() else {
            print("Nothing found create default")
            generateBaseQuestions()
            return
        }
        QuestionManager.questionSetArray = questionSetArray
        guard let savedUserStats = DataManager.loadUserStats() else  {
            userStats.selectionIndex = 0
            userStats.userScore = 0
            print("No save data found")
            if QuestionManager.questionSetArray.count == 0 { //If somehow the data base still manages to get wiped
            generateBaseQuestions() // we will generate the base questions again.
            setup()
            } else {
                setup()
            }
            return
        }
        userStats = savedUserStats
        print("Found saved data")
        setup()
        DataManager.saveQuestionArray(questionSetArray: QuestionManager.questionSetArray)
    }
    
    
    /* Setup is called everytime we change question, Basically what it does it that it will take whatever choice
     the user has selected and pull out a question from the QuestionManager array, from there it will set all our
     buttons to be incorrect, and then it will go through the answers inside of the QuestionSet and assign each
     ones description to a button and then if the answer was the correct answer; it will assign the button to be
     correct. Thus, you can have multiple correct answers in a question if you wanted to.
     */
    func setup() {
        print(userStats.selectionIndex)
        if userStats.selectionIndex <= (QuestionManager.questionSetArray.count - 1) {
            self.view.backgroundColor = UIColor.white
            self.navigationController?.navigationBar.barTintColor  = UIColor.white
            questionLabel.text = QuestionManager.questionSetArray[userStats.selectionIndex].displayDescription
            buttonOneCorrect = false
            buttonTwoCorrect = false
            buttonThreeCorrect = false
            buttonFourCorrect = false
            for (index,answer) in QuestionManager.questionSetArray[userStats.selectionIndex].answerArray.enumerated() {
                if index == 0 {
                    buttonOne.setTitle(answer.displayName, for: UIControl.State.normal)
                    if answer.isCorrect {
                        buttonOneCorrect = true
                    }
                }
                if index == 1 {
                    buttonTwo.setTitle(answer.displayName, for: UIControl.State.normal)
                    if answer.isCorrect {
                        buttonTwoCorrect = true
                    }
                }
                if index == 2 {
                    buttonThree.setTitle(answer.displayName, for: UIControl.State.normal)
                    if answer.isCorrect {
                        buttonThreeCorrect = true
                    }
                }
                if index == 3 {
                    buttonFour.setTitle(answer.displayName, for: UIControl.State.normal)
                    if answer.isCorrect {
                        buttonFourCorrect = true
                    }
                }
            }
            fadeIn()
        }
    }
    
    @IBAction func buttonOnePressed(_ sender: Any) {
        if buttonOneCorrect == true {
            setCorrectColor()
        } else {
            setWrongColor()
        }
    }
    
    @IBAction func buttonTwoPressed(_ sender: Any) {
        if buttonTwoCorrect == true {
            setCorrectColor()
        } else {
            setWrongColor()
        }
    }
    
    @IBAction func buttonThreePressed(_ sender: Any) {
        if buttonThreeCorrect {
            setCorrectColor()
        } else {
            setWrongColor()
        }
    }
    
    @IBAction func buttonFourPressed(_ sender: Any) {
        if buttonFourCorrect {
            setCorrectColor()
        } else {
            setWrongColor()
            
        }
    }
    func resetGame() {
        userStats.selectionIndex = 0
        QuestionManager.questionSetArray = QuestionManager.masterQuestionSetArray
        userStats.userScore = 0
        setup()
    }
    
    
    
    func setCorrectColor() {
        view.backgroundColor = UIColor.green
        self.navigationController?.navigationBar.barTintColor  = UIColor.green
        userStats.userScore += 10
        QuestionManager.questionSetArray.remove(at: userStats.selectionIndex)
        let questionsLeft = QuestionManager.questionSetArray.count
        if questionsLeft == 0 {
            let alert = UIAlertController(title: "You won!", message: "Final score: \(userStats.userScore)", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    self.resetGame()
                case .cancel:
                    print("cancel")
                case .destructive:
                    print("destructive")
                }}))
            self.present(alert, animated: true, completion: nil)
        } else {
            userStats.selectionIndex = Int(arc4random_uniform(UInt32(QuestionManager.questionSetArray.count)))
            DataManager.saveQuestionArray(questionSetArray: QuestionManager.questionSetArray)
            DataManager.saveUserStats(userStats: userStats)
            print("correct")
            fadeOut()
        }
    }
    func setWrongColor() {
        view.backgroundColor = UIColor.red
        self.navigationController?.navigationBar.barTintColor  = UIColor.red
        if userStats.userScore != 0 {
            userStats.userScore -= 10
        }
    }
    
    func fadeOut() {
        let animator = UIViewPropertyAnimator(duration: 1, curve: .easeInOut)
        animator.addAnimations {
            self.containerView.alpha = 0.0
        }
        animator.addCompletion() {
            _ in
            self.setup()
        }
        animator.startAnimation()
    }
    func fadeIn() {
        let animator = UIViewPropertyAnimator(duration: 1, curve: .easeInOut)
        animator.addAnimations {
            self.containerView.alpha = 1.0
        }
        animator.startAnimation()
    }
    
    
    
    
    func generateBaseQuestions () {
        let basicQuestionSet = QuestionSet.init(
            firstAnswer: Answer.init(displayName: "tester1", isCorrect: true),
            secondAnswer: Answer.init(displayName: "tester2"),
            thirdAnswer: Answer.init(displayName: "tester3"),
            fourthAnswer: Answer.init(displayName: "tester4"),
            displayDescription: "This is a first basic question. Press the first button to continue!")
        let basicQuestionSetTwo = QuestionSet.init(
            firstAnswer: Answer.init(displayName: "5"),
            secondAnswer: Answer.init(displayName: "13"),
            thirdAnswer: Answer.init(displayName: "60", isCorrect: true),
            fourthAnswer: Answer.init(displayName: "80"),
            displayDescription: "How many minutes are in an hour?")
        let basicQuestionSetThree = QuestionSet.init(
            firstAnswer: Answer.init(displayName: "363"),
            secondAnswer: Answer.init(displayName: "364"),
            thirdAnswer: Answer.init(displayName: "365", isCorrect: true),
            fourthAnswer: Answer.init(displayName: "366"),
            displayDescription: "How many days are in an year?")
        let basicQuestionSetFour = QuestionSet.init(
            firstAnswer: Answer.init(displayName: "Cat"),
            secondAnswer: Answer.init(displayName: "Dog", isCorrect: true),
            thirdAnswer: Answer.init(displayName: "Mouse"),
            fourthAnswer: Answer.init(displayName: "Snake"),
            displayDescription: "Which animal is man's best friend??")
        QuestionManager.addQuestionSet(QuestionSet: basicQuestionSet)
        QuestionManager.addQuestionSet(QuestionSet: basicQuestionSetTwo)
        QuestionManager.addQuestionSet(QuestionSet: basicQuestionSetThree)
        QuestionManager.addQuestionSet(QuestionSet: basicQuestionSetFour)
        DataManager.saveQuestionArray(questionSetArray: QuestionManager.questionSetArray)
        DataManager.saveMasterQuestionArray(questionSetArray: QuestionManager.masterQuestionSetArray)
    }
    
}

