
// UserStats isn't overly important, but it does manage what question the user is/was on and keep track of score.
// enough said.

import Foundation
class UserStats: NSObject, NSCoding {
    
    
    var selectionIndex: Int
    var userScore: Int
    
    
    init(selectionIndex: Int, userScore: Int) {
        self.selectionIndex = selectionIndex
        self.userScore = userScore
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(selectionIndex, forKey: "selectionIndex")
        aCoder.encode(userScore, forKey: "userScore")
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        let selectionIndex = aDecoder.decodeInteger(forKey: "selectionIndex")
        let userScore = aDecoder.decodeInteger(forKey: "userScore")
        self.init(selectionIndex: selectionIndex, userScore: userScore)
    }
    
}
