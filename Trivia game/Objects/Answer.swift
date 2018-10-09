//
//  Answer.swift
//  Trivia game
//
//  Created by Jacob Finn on 10/8/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import Foundation
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
