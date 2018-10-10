//
//  QuestionManager.swift
//  Trivia game
//
//  Created by Jacob Finn on 10/8/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import Foundation

//QuestionManager is a rather simple Class that doesn't contain much, but do not doubt its usefulness. I use it multiple times in my code throughout the entire project.

class QuestionManager {
    
    static var questionSetArray = [QuestionSet]()
    
    // Because the project requirements were released when
    // I almost had the project completely done, I had to do some rather unique work arounds to make everything
    // work without having to rewrite all my code.
    static var masterQuestionSetArray = [QuestionSet]()
    
    
    

    
    
    // If a QuestionSet is created is created without an answer then the user would never be able to beat it.
    // This check makes sure that an answer does exist before the QuestionSet is created.
    static func addQuestionSet(QuestionSet: QuestionSet) {
        for answer in QuestionSet.answerArray {
            if answer.isCorrect {
                masterQuestionSetArray.append(QuestionSet)
                questionSetArray.append(QuestionSet)
            }
        }
    }
}
