
import UIKit

class ViewController: UIViewController {
    //-------- --------- Variables --------- ----------//
    
    var selection = 0 // This tells us what question the user is on. This will need to be saved later and reloaded
    var buttonOneCorrect = false    // these will allow us to associate a bool value with the buttons so we know
    var buttonTwoCorrect = false    // which one of the buttons is correct.
    var buttonThreeCorrect = false
    var buttonFourCorrect = false
    @IBOutlet weak var containerView: UIView!
    
    //-------- --------- --------- --------- ----------//
    
    
    //-------- --------- StoryBoard --------- ----------//
    
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
        QuestionManager.addQuestionSet(QuestionSet: basicQuestionSet)
        QuestionManager.addQuestionSet(QuestionSet: basicQuestionSetTwo)
        // These are debug variables. Remove them later!
        DataManager.saveData(questionSetArray: QuestionManager.questionSetArray)
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        self.navigationController?.navigationBar.barTintColor  = UIColor.white
        view.backgroundColor = UIColor.white
        
    }
    
    func setup() {
        if selection <= (QuestionManager.questionSetArray.count - 1) {
            questionLabel.text = QuestionManager.questionSetArray[selection].displayDescription
            buttonOneCorrect = false
            buttonTwoCorrect = false
            buttonThreeCorrect = false
            buttonFourCorrect = false
            for (index,answer) in QuestionManager.questionSetArray[selection].answerArray.enumerated() {
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
    
    func setCorrectColor() {
        view.backgroundColor = UIColor.green
        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        self.navigationController?.navigationBar.barTintColor  = UIColor.green
        selection += 1
        print("correct")
        fadeOut()
    }
    func setWrongColor() {
        view.backgroundColor = UIColor.red
        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        self.navigationController?.navigationBar.barTintColor  = UIColor.red
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
        print("Adding animation")
        animator.addAnimations {
            self.containerView.alpha = 1.0
        }
        print("starting animation")
        animator.startAnimation()
    }
    
}

