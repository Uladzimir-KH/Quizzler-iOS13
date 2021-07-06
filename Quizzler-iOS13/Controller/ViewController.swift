//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var score: UILabel!
    
    var quiz = QuizModel()
    
    var timer: Timer = Timer.scheduledTimer(withTimeInterval: 0.0, repeats: false) {_ in}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAnswersOnButtons()
        progressBar.progress = 0.0
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        progressBar.progress = quiz.getProgress()
        
        if quiz.checkAnswer(sender.titleLabel!.text ?? "") {
            colorizeButton(sender, UIColor.green)
        } else {
            colorizeButton(sender, UIColor.red)
        }
        
        if quiz.isEndQuestion() {
            let alert = UIAlertController(title: "Good job!", message: "\(quiz.rightAnswersCount) from \(quiz.questions.count) are rights", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
                self.quiz = QuizModel()
                self.viewDidLoad()
            }))
            self.present(alert, animated: true, completion: {                self.timer.invalidate()
            })
            return
        }
        
        questionLabel.text = quiz.nextQuestion()
        setAnswersOnButtons()
    }
    
    @objc func updateUI() {
        firstButton.backgroundColor = UIColor.clear
        secondButton.backgroundColor = UIColor.clear
        thirdButton.backgroundColor = UIColor.clear
        questionLabel.text = quiz.getCurrentQuestion()
        if quiz.rightAnswersCount != 0 {
            score.text = "Score: \(quiz.rightAnswersCount)"
        } else {
            score.text = ""
        }
    }
    
    func colorizeButton(_ senderr: UIButton, _ color: UIColor) {
        timer.invalidate()
        updateUI()
        senderr.backgroundColor = color
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
//            print("Timer fired!")
//            senderr.backgroundColor = UIColor.init(white: 1, alpha: 0)
//        }
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    func setAnswersOnButtons() {
        firstButton.setTitle(quiz.getAnswerByButtonNumber(0), for: UIControl.State.normal)
        secondButton.setTitle(quiz.getAnswerByButtonNumber(1), for: UIControl.State.normal)
        thirdButton.setTitle(quiz.getAnswerByButtonNumber(2), for: UIControl.State.normal)
        
    }
}

