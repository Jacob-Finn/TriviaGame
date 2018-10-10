//
//  UserSettingsController.swift
//  Trivia game
//
//  Created by Jacob Finn on 10/9/18.
//  Copyright © 2018 Jacob Finn. All rights reserved.
//

import UIKit
class UserSettingsController: UIViewController {
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var userScoreLabel: UILabel!

    
    
    var userStats = UserStats.init(selectionIndex: 0, userScore: 0)
    var userWarned = false
    var userConfirmed = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barStyle = UIBarStyle.blackTranslucent
        self.navigationController?.navigationBar.barTintColor  = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetButton.layer.cornerRadius = 8
        guard let savedUserStats = DataManager.loadUserStats() else {
            print("Unable to load userStats")
            setDefaultStats()
            return
        }
        userStats = savedUserStats
        userScoreLabel.text = String(userStats.userScore)
    }
    func setDefaultStats() {
        userScoreLabel.text = String(userStats.userScore)
    }
    
    @IBAction func resetTapped(_ sender: Any) {
        if !userWarned {
            resetButton.setTitle("Are you sure?", for: .normal)
            userWarned = true
        
        } else if !userConfirmed {
            userConfirmed = true
        }
        if userWarned && userConfirmed {
        userStats.selectionIndex = 0
        resetButton.setTitle("Data reset", for: .normal)
        DataManager.saveUserStats(userStats: userStats)
        resetButton.isUserInteractionEnabled = false
        resetButton.tintColor = UIColor.darkGray
        userScoreLabel.text = String(userStats.selectionIndex)
        QuestionManager.questionSetArray = QuestionManager.masterQuestionSetArray
        DataManager.saveQuestionArray(questionSetArray: QuestionManager.questionSetArray)
        }
    }
    
    
    
    
    
}
