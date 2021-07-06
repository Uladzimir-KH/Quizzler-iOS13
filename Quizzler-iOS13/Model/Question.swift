//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Vladimir Khrolovich on 28.06.21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let questionText: String
    let answers: [String]
    let correct: String
    
    init(q: String, a: [String], correctAnswer: String) {
        questionText = q
        answers = a
        correct = correctAnswer
    }
}
