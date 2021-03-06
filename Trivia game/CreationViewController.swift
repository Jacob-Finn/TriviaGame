

import UIKit

/* The CreationViewController is probably one of the best viewControllers I have made so far and is very
 understandable and easily accessed. It guides the users through the creation and makes it easy to tell what
 parts of a QuestionSet the user can edit at a time, and it allows user to go back and modify their answer if they
 wanted, and it allows for answers to easily be set as incorrect or correct.
 
 */

class CreationViewController: UIViewController {
    
    //-------- --------- Variables --------- ----------//
    enum States {
        case questionEdit
        case answerOne
        case answerTwo
        case answerThree
        case answerFour
        case finished
    }
    var currentState: States = .questionEdit
    var submitionAllowed = true
    
    var displayDescription = ""
    var answerOne = Answer(displayName: "")
    var answerTwo = Answer(displayName: "")
    var answerThree = Answer(displayName: "")
    var answerFour = Answer(displayName: "")
    
    //-------- --------- --------- --------- ----------//
    
    
    //-------- --------- StoryBoard --------- ----------//
    
    // The views are what the buttons are contained in. Originally these would've changed colors on selection
    // but this idea was changed later.
    @IBOutlet weak var displayDescriptionView: UIView!
    @IBOutlet weak var questionOneView: UIView!
    @IBOutlet weak var questionTwoView: UIView!
    @IBOutlet weak var questionThreeView: UIView!
    @IBOutlet weak var questionFourView: UIView!
    
    // Misc stuff
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var correctSwitch: UISwitch!
    @IBOutlet weak var correctAnswerLabel: UILabel!
    
    // The buttons are what are inside of the views.
    @IBOutlet weak var displayDescriptionButton: UIButton!
    @IBOutlet weak var questionOneButton: UIButton!
    @IBOutlet weak var questionTwoButton: UIButton!
    @IBOutlet weak var questionThreeButton: UIButton!
    @IBOutlet weak var questionFourButton: UIButton!
    
    
    //-------- --------- --------- --------- ----------//
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        self.navigationController?.navigationBar.barTintColor  = UIColor.white
        currentState = .questionEdit
        questionOneButton.isUserInteractionEnabled = false
        questionTwoButton.isUserInteractionEnabled = false
        questionThreeButton.isUserInteractionEnabled = false
        questionFourButton.isUserInteractionEnabled = false
        switchState()
        
    }
    
    func switchState(){
        switch currentState {
        case .questionEdit:
            informationLabel.text = "Please enter your new question!"
            submitButton.setTitle("Continue", for: UIControl.State.normal)
            if displayDescription != "" {
                textField.text = displayDescription
            } else {
                textField.text = ""
            }
        case .answerOne:
            informationLabel.text = "Please enter your first answer!"
            submitButton.setTitle("Continue", for: UIControl.State.normal)
            if answerOne.isCorrect {
                correctSwitch.isOn = true
            } else {
                correctSwitch.isOn = false
            }
            if answerOne.displayName != "" {
                textField.text = answerOne.displayName
            } else {
                textField.text = ""
            }
        case .answerTwo:
            informationLabel.text = "Please enter your second answer!"
            submitButton.setTitle("Continue", for: UIControl.State.normal)
            if answerTwo.isCorrect {
                correctSwitch.isOn = true
            } else {
                correctSwitch.isOn = false
            }
            if answerTwo.displayName != "" {
                textField.text = answerTwo.displayName
            } else {
                textField.text = ""
            }
        case .answerThree:
            informationLabel.text = "Please enter your third answer!"
            submitButton.setTitle("Continue", for: UIControl.State.normal)
            if answerThree.isCorrect {
                correctSwitch.isOn = true
            } else {
                correctSwitch.isOn = false
            }
            if answerThree.displayName != "" {
                textField.text = answerThree.displayName
            } else {
                textField.text = ""
            }
        case .answerFour:
            informationLabel.text = "Please enter your fourth answer!"
            submitButton.setTitle("Continue", for: UIControl.State.normal)
            if answerFour.isCorrect {
                correctSwitch.isOn = true
            } else {
                correctSwitch.isOn = false
            }
            if answerFour.displayName != "" {
                textField.text = answerFour.displayName
            } else {
                textField.text = ""
            }
        case .finished:
            informationLabel.text = "Please press the continue button to submit your question!"
            submitButton.setTitle("Submit", for: UIControl.State.normal)
            correctSwitch.isHidden = true
            correctAnswerLabel.isHidden = true
            informationLabel.isHidden = true
            textField.isHidden = true
        }
    }
    
    // Upon finishing a trivia question, the .finished state hides some essential items, so we need to fix that if we're going
    // back to a previous state
    func checkIfFinished() {
        if currentState == .finished {
            textField.isHidden = false
            correctSwitch.isHidden = false
            informationLabel.isHidden = false
            correctAnswerLabel.isHidden = false
        } else {
            return
        }
    }
    
    @IBAction func questionButtonTapped(_ sender: Any) {
        checkIfFinished()
        currentState = .questionEdit
        switchState()
    }
    @IBAction func answerOneTapped(_ sender: Any) {
        checkIfFinished()
        currentState = .answerOne
        switchState()
    }
    @IBAction func answerTwoTapped(_ sender: Any) {
        checkIfFinished()
        currentState = .answerTwo
        switchState()
    }
    @IBAction func answerThreeTapped(_ sender: Any) {
        checkIfFinished()
        currentState = .answerThree
        switchState()
    }
    @IBAction func answerFourTapped(_ sender: Any) {
        checkIfFinished()
        currentState = .answerFour
        switchState()
    }
    
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        switch currentState {
        case .questionEdit:
            displayDescription = textField.text!
            textField.text = ""
            questionOneButton.isUserInteractionEnabled = true
            questionOneButton.setTitleColor(nil, for: UIControl.State.normal)
            currentState = .answerOne
            switchState()
        case .answerOne:
            answerOne.displayName = textField.text!
            textField.text = ""
            questionTwoButton.isUserInteractionEnabled = true
            questionTwoButton.setTitleColor(nil, for: UIControl.State.normal)
            if correctSwitch.isOn {
                answerOne.isCorrect = true
            }
            currentState = .answerTwo
            switchState()
            correctSwitch.isOn = false
        case .answerTwo:
            answerTwo.displayName = textField.text!
            textField.text = ""
            questionThreeButton.isUserInteractionEnabled = true
            questionThreeButton.setTitleColor(nil, for: UIControl.State.normal)
            if correctSwitch.isOn {
                answerTwo.isCorrect = true
            }
            currentState = .answerThree
            switchState()
            correctSwitch.isOn = false
        case .answerThree:
            answerThree.displayName = textField.text!
            textField.text = ""
            questionFourButton.isUserInteractionEnabled = true
            questionFourButton.setTitleColor(nil, for: UIControl.State.normal)
            if correctSwitch.isOn {
                answerThree.isCorrect = true
            }
            currentState = .answerFour
            switchState()
            correctSwitch.isOn = false
        case .answerFour:
            answerFour.displayName = textField.text!
            textField.text = ""
            if correctSwitch.isOn {
                answerFour.isCorrect = true
            }
            currentState = .finished
            switchState()
            correctSwitch.isOn = false
        case .finished:
            if (answerOne.displayName == "" || answerTwo.displayName == "" || answerThree.displayName == "" || answerFour.displayName == "") {
                submitionAllowed = false
                let alert = UIAlertController(title: "Error!", message: "One of the answers has been left blank!", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Return", style: .default, handler: { action in
                    self.checkIfFinished()
                    self.currentState = .questionEdit
                    self.switchState()
                    
                }))
                self.present(alert, animated: true, completion: nil)
            } else {
                if (answerOne.isCorrect != true || answerTwo.isCorrect != true || answerThree.isCorrect != true || answerFour.isCorrect != true) {
                    submitionAllowed = false
                    let alert = UIAlertController(title: "Error!", message: "At least one answer has to be correct!", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Return", style: .default, handler: { action in
                        self.checkIfFinished()
                        self.currentState = .questionEdit
                        self.switchState()
                        
                    }))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    submitionAllowed = true
                    if submitionAllowed {
                        let newQuestionSet = QuestionSet(firstAnswer: answerOne, secondAnswer: answerTwo, thirdAnswer: answerThree, fourthAnswer: answerFour, displayDescription: displayDescription)
                        QuestionManager.addQuestionSet(QuestionSet: newQuestionSet)
                        DataManager.saveQuestionArray(questionSetArray: QuestionManager.questionSetArray)
                        DataManager.saveMasterQuestionArray(questionSetArray: QuestionManager.masterQuestionSetArray)
                        navigationController?.popViewController(animated: true)
                    }
                }
            }
        }
    }
}
