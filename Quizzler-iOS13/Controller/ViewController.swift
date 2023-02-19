//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    
    
    // copy of our struct
    var quizBrain = QuizBrain()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        //func has 2 roles: 1) answer checking part
        
        let userAnswer = sender.currentTitle! //True, False
        let userGotItRight = quizBrain.checkAnswer(userAnswer)//when this line runs this line will be replaces with the value of the output
        //let actualAnswer = quiz[questionNumber].answer
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        //2) quiz progression
        
        quizBrain.nextQuestion()
        
        
        
    }
    
    @objc func updateUI() {
        //let text = quiz[questionNumber].text
        questionLabel.text = quizBrain.getQuestionText()
        
        //Set a title to a button .setTitle
        choice1.setTitle(quizBrain.getQuestionAnswer()[0], for: .normal) //create a method getQuestionAnswer()
        choice2.setTitle(quizBrain.getQuestionAnswer()[1], for: .normal)
        choice3.setTitle(quizBrain.getQuestionAnswer()[2], for: .normal)
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
        
    }
    
}

