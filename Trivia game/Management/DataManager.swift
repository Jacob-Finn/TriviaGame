//
//  DataManager.swift
//  Trivia game
//
//  Created by Jacob Finn on 10/8/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import Foundation
// Anything that has to be saved and loaded between views or through loads is saved by the Data Manager.
// This manager is probably the most useful one, though, the masterQuestionArray was made as an after thought.
// It would be possible to condense saveQuestionArray and saveMasterQuestionArray into one function, but I think
// it just looks better in the code to have two seperate functions. Way easier to distinguish.
class DataManager {
    static func saveQuestionArray(questionSetArray: [QuestionSet]) {
        let savedQuestionSetArray = questionSetArray
        let savedData = NSKeyedArchiver.archivedData(withRootObject: savedQuestionSetArray)
        UserDefaults.standard.set(savedData, forKey: "questionSetArray")
    }
    
    static func loadQuestionArray() -> [QuestionSet]? {
        guard let savedQuestionArray = UserDefaults.standard.value(forKey: "questionSetArray") else {
            return nil
        }
        let questionSetArray = NSKeyedUnarchiver.unarchiveObject(with: savedQuestionArray as! Data)
        return questionSetArray as? [QuestionSet]
    }
    
    

    static func saveMasterQuestionArray(questionSetArray: [QuestionSet]) {
        let savedQuestionSetArray = questionSetArray
        let savedData = NSKeyedArchiver.archivedData(withRootObject: savedQuestionSetArray)
        UserDefaults.standard.set(savedData, forKey: "masterQuestionSetArray")
    }
    
    static func loadMasterQuestionArray() -> [QuestionSet]? {
        guard let savedQuestionArray = UserDefaults.standard.value(forKey: "masterQuestionSetArray") else {
            return nil
        }
        let questionSetArray = NSKeyedUnarchiver.unarchiveObject(with: savedQuestionArray as! Data)
        return questionSetArray as? [QuestionSet]
    }
    
    
    
    
    static func saveUserStats(userStats: UserStats) {
        let savedUserStats = userStats
        do {
            let savedData = try NSKeyedArchiver.archivedData(withRootObject: savedUserStats, requiringSecureCoding: false)
            UserDefaults.standard.set(savedData, forKey: "userStats")
        } catch {
            print("Unable to load")
        }
    }
    static func loadUserStats() -> UserStats? {
        guard let savedUserStats = UserDefaults.standard.value(forKey: "userStats") else {
            return nil
        }
        var userStats = NSKeyedUnarchiver.unarchiveObject(with: savedUserStats as! Data)
        return userStats as? UserStats
    }
    
    
}
