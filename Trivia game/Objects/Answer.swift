
import Foundation
// Answer is the lifeblood of the QuestionSet, Each QuestionSet is made up of Answers that contain their name and
// if they are correct answers individually. This is unique in that it allows me to make questions with multiple
// correct answers, and theoretically I could have as many answers in a QuestionSet as I wanted.
class Answer: NSObject, NSCoding {
    var displayName: String
    var isCorrect: Bool

    init(displayName: String) {
        self.displayName = displayName
        self.isCorrect = false
    }
    init(displayName: String, isCorrect: Bool) {
        self.displayName = displayName
        self.isCorrect = isCorrect
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.displayName, forKey: "displayName")
        aCoder.encode(self.isCorrect, forKey: "isCorrect")
    }
    convenience required init?(coder aDecoder: NSCoder) {
        let displayName =  aDecoder.decodeObject(forKey: "displayName") as! String
        let isCorrect = aDecoder.decodeBool(forKey: "isCorrect")
        self.init(displayName: displayName, isCorrect: isCorrect)
    }
    
    
    
}
