//
//  QuizModel.swift
//  Quizzler-iOS13
//
//  Created by Vladimir Khrolovich on 6.07.21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct QuizModel{
    let questions = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
                Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
                Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
                Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
                Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
                Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
                Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
                Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
                Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
                Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

    ]
    
    var questionNumber = 0
    var rightAnswersCount = 0
    
    mutating func checkAnswer(_ answer: String) -> Bool {
        if questions[questionNumber].correct == answer {
            rightAnswersCount += 1
            return true
        } else {
            return false
        }
    }
    
    mutating func nextQuestion() -> String {
        if questionNumber + 1 < questions.count {
            questionNumber += 1
        } else {
            clearCounters()
        }
        return questions[questionNumber].questionText
    }
    
    func getAnswerByButtonNumber(_ number: Int) -> String {
        questions[questionNumber].answers[number]
    }
    
    func getCurrentQuestion() -> String {
        questions[questionNumber].questionText
    }
    
    func isEndQuestion() -> Bool {
        if questionNumber >= questions.count - 1 {
            return true
        } else {
            return false
        }
    }
    
    func getProgress() -> Float {
        Float(questionNumber + 1) / Float(questions.count)
    }

    mutating func clearCounters() {
        questionNumber = 0
        rightAnswersCount = 0
    }
    
    
}
