//
//  QuestionManager.swift
//  Trivia game
//
//  Created by Jacob Finn on 10/8/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import Foundation
class QuestionManager {
    static var questionSetArray = [QuestionSet]()

    
    
    // If a QuestionSet is created is created without an answer then the user would never be able to beat it.
    // This check makes sure that an answer does exist before the QuestionSet is created.
    static func addQuestionSet(QuestionSet: QuestionSet) {
        for Answer in QuestionSet.answerArray {
            if Answer.isCorrect {
                questionSetArray.append(QuestionSet)
            }
        }
    }
}
