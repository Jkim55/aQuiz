//
//  quizVC.swift
//  aQuiz
//
//  Created by Ji Kim on 10/31/16.
//  Copyright © 2016 ThunderWhatever. All rights reserved.
//

import UIKit

// question prototype for Questions array below
struct question {
    var q : String!
    var answers : [String]!
    var answer : Int!
}

class quizVC: UIViewController {
    // OUTLET: 2 way Bind to view
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var AnswerBtn: [UIButton]!
    @IBOutlet weak var Results: UILabel!
    
    // VARIABLES used within view
    var Questions = [question]()
    var qNum = Int()
    var answerNum = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // array of questions
        Questions = [
            question(q: "Which city is Colorado's capital?", answers: ["Denver","Fort Collins","Boulder","Colorado Springs"], answer: 0),
            question(q: "Which city is California's capital?", answers: ["Los Angeles","San Diego","San Francisco","Sacramento"], answer: 3),
            question(q: "Who won the Stanley Cup last year?", answers: ["LA Kings","Boston Bruins","Pittsburg Penguins","Chicago Blackhawks"], answer: 2)
        ]
        pickQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // FUNCTION: Dyn generates quiz with answer & questions
    func pickQuestion() {
        if Questions.count > 0 {
            qNum = 0
            questionLabel.text = Questions[qNum].q
            answerNum = Questions[qNum].answer
            
            for i in 0..<AnswerBtn.count{
                AnswerBtn[i].setTitle(Questions[qNum].answers[i], for: UIControlState.normal)
            }
//            NSLog("\(Questions.count)")
            Questions.remove(at: qNum)
        } else {
            NSLog("Donzo")
            performSegue(withIdentifier: "endOfQuiz", sender: nil)
        }
    }
    
    @IBAction func btn0Pressed(_ sender: UIButton) {
        if answerNum == 0 {
            Results.text = "Yay! You're correct!"
            pickQuestion()
        } else {
            NSLog("\(answerNum)")
            Results.text = "No Cigar!"
        }
    }
    
    @IBAction func btn1Pressed(_ sender: UIButton) {
        if answerNum == 1 {
            Results.text = "Yay! You're correct!"
            pickQuestion()
        } else {
            NSLog("\(answerNum)")
            Results.text = "BOoooooo!"
        }
    }
    
    @IBAction func btn2Pressed(_ sender: UIButton) {
        if answerNum == 2 {
            Results.text = "Yay! You're correct!"
            pickQuestion()
        } else {
            Results.text = "Looooost again sucker"
        }
    }
    
    @IBAction func btn3Pressed(_ sender: UIButton) {
        if answerNum == 3 {
            Results.text = "Yay! You're correct!"
            pickQuestion()
        } else {
            NSLog("\(answerNum)")
            Results.text = "Giving up is ok"
            pickQuestion()
        }
    }
}
