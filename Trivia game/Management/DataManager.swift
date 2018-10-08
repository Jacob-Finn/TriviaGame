//
//  DataManager.swift
//  Trivia game
//
//  Created by Jacob Finn on 10/8/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import Foundation

class DataManager {
    static func saveData(questionSetArray: [QuestionSet]) {
        let savedQuestionSetArray = questionSetArray
        let savedData = NSKeyedArchiver.archivedData(withRootObject: savedQuestionSetArray)
        UserDefaults.standard.set(savedData, forKey: "questionSetArray")
    }
    
    static func loadData() -> [QuestionSet]? {
        guard let savedQuestionArray = UserDefaults.standard.value(forKey: "questionSetArray") else {
            return nil
        }
        let questionSetArray = NSKeyedUnarchiver.unarchiveObject(with: savedQuestionArray as! Data)
        return questionSetArray as? [QuestionSet]
    }
}
