//
//  Answer.swift
//  Trivia game
//
//  Created by Jacob Finn on 10/8/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import Foundation
class Answer {
    let displayName: String
    let isCorrect: Bool

    init(displayName: String) {
        self.displayName = displayName
        self.isCorrect = false
    }
    init(displayName: String, isCorrect: Bool) {
        self.displayName = displayName
        self.isCorrect = isCorrect
    }
    
    
    
    
}
