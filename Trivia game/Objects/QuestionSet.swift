

import Foundation
// QuestionSet is almost like a manager, but on an object level. QuestionSet will organize its answers and description to make for a condensed and easy to access package that I can display and manipulate.

class QuestionSet: NSObject, NSCoding {
    let answerOne: Answer
    let answerTwo: Answer
    let answerThree: Answer
    let answerFour: Answer
    let displayDescription: String
    var answerArray: [Answer]
    
    init(firstAnswer answerOne: Answer, secondAnswer answerTwo: Answer, thirdAnswer answerThree: Answer, fourthAnswer answerFour: Answer, displayDescription: String) {
        self.answerOne = answerOne
        self.answerTwo = answerTwo
        self.answerThree = answerThree
        self.answerFour = answerFour
        self.answerArray = [Answer]()
        self.answerArray.append(answerOne)
        self.answerArray.append(answerTwo)
        self.answerArray.append(answerThree)
        self.answerArray.append(answerFour)
        self.displayDescription = displayDescription
    }
    init(answerArray: [Answer], displayDescription: String) {
        self.answerArray = answerArray
        self.answerOne = answerArray[0]
        self.answerTwo = answerArray[1]
        self.answerThree = answerArray[2]
        self.answerFour = answerArray[3]
        self.displayDescription = displayDescription
    }
    
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(answerArray, forKey: "answerArray")
        aCoder.encode(displayDescription, forKey: "displayDescription")
    }
    convenience required init?(coder aDecoder: NSCoder) {
        let answerArray = aDecoder.decodeObject(forKey: "answerArray") as! [Answer]
        let displayDescription = aDecoder.decodeObject(forKey: "displayDescription") as! String
        self.init(answerArray: answerArray, displayDescription: displayDescription)
    }
    
    
    
}
