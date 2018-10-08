
import UIKit

class ViewController: UIViewController {
    //-------- --------- Variables --------- ----------//
    
    var selection = 0 // This tells us what question the user is on. This will need to be saved later and reloaded
    var buttonOneCorrect = false    // these will allow us to associate a bool value with the buttons so we know
    var buttonTwoCorrect = false    // which one of the buttons is correct.
    var buttonThreeCorrect = false
    var buttonFourCorrect = false
    
    
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
    //-------- --------- --------- --------- ----------//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let basicQuestionSet = QuestionSet.init(
            firstAnswer: Answer.init(displayName: "testing", isCorrect: true),
            secondAnswer: Answer.init(displayName: "tester2"),
            thirdAnswer: Answer.init(displayName: "tester3"),
            fourthAnswer: Answer.init(displayName: "tester4"))
        QuestionManager.addQuestionSet(QuestionSet: basicQuestionSet)
        DataManager.saveData(questionSetArray: QuestionManager.questionSetArray)
        print(buttonOneCorrect)
        print(buttonTwoCorrect)
        print(buttonThreeCorrect)
        print(buttonFourCorrect)
        setup()
    }
    
    
    func setup() {
        if selection <= (QuestionManager.questionSetArray.count - 1) {
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
        }
    }
    
    @IBAction func buttonOnePressed(_ sender: Any) {
        if buttonOneCorrect == true {
            view.backgroundColor = UIColor.green
            selection += 1
            setup()
        } else {
            view.backgroundColor = UIColor.red
        }
    }
    
    @IBAction func buttonTwoPressed(_ sender: Any) {
        if buttonTwoCorrect == true {
            view.backgroundColor = UIColor.green
            selection += 1
            setup()
        } else {
            view.backgroundColor = UIColor.red
        }
    }
    
    @IBAction func buttonThreePressed(_ sender: Any) {
        if buttonThreeCorrect {
            view.backgroundColor = UIColor.green
            selection += 1
            setup()
        } else {
            view.backgroundColor = UIColor.red
        }
    }
    
    @IBAction func buttonFourPressed(_ sender: Any) {
        if buttonFourCorrect {
            view.backgroundColor = UIColor.green
            selection += 1
            setup()
        } else {
            view.backgroundColor = UIColor.red
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

