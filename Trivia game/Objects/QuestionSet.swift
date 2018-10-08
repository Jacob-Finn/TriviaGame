//
//  QuestionSet.swift
//  Trivia game
//
//  Created by Jacob Finn on 10/8/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import Foundation
class QuestionSet {
    let answerOne: Answer
    let answerTwo: Answer
    let answerThree: Answer
    let answerFour: Answer
    
    
    init(firstAnswer answerOne: Answer, secondAnswer answerTwo: Answer, thirdAnswer answerThree: Answer, fourthAnswer answerFour: Answer ) {
        self.answerOne = answerOne
        self.answerTwo = answerTwo
        self.answerThree = answerThree
        self.answerFour = answerFour
    }
    
    
    
}
