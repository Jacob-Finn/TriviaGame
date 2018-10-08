//
//  QuestionSet.swift
//  Trivia game
//
//  Created by Jacob Finn on 10/8/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import Foundation
class QuestionSet: NSObject, NSCoding {
    let answerOne: Answer
    let answerTwo: Answer
    let answerThree: Answer
    let answerFour: Answer
    var answerArray: [Answer]
    
    init(firstAnswer answerOne: Answer, secondAnswer answerTwo: Answer, thirdAnswer answerThree: Answer, fourthAnswer answerFour: Answer ) {
        self.answerOne = answerOne
        self.answerTwo = answerTwo
        self.answerThree = answerThree
        self.answerFour = answerFour
        self.answerArray = [Answer]()
        self.answerArray.append(answerOne)
        self.answerArray.append(answerTwo)
        self.answerArray.append(answerThree)
        self.answerArray.append(answerFour)
    }
    init(answerArray: [Answer]) {
        self.answerArray = answerArray
        self.answerOne = answerArray[0]
        self.answerTwo = answerArray[1]
        self.answerThree = answerArray[2]
        self.answerFour = answerArray[3]
    }
    
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(answerArray, forKey: "answerArray")
    }
    convenience required init?(coder aDecoder: NSCoder) {
        let answerArray = aDecoder.decodeObject(forKey: "answerArray") as! [Answer]
        self.init(answerArray: answerArray)
    }
    
    
    
}
