//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Daiana koishebayeva on 17.01.2023.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    //we can create a custom initializer init()
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        self.correctAnswer = correctAnswer
    }
}
