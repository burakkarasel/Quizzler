//
//  ViewController.swift
//  Quizzler
//
//  Created by Burak Karasel on 7.08.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBarView: UIProgressView!
    @IBOutlet weak var restartButton: UIButton!
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    var timer = Timer()
        
    var quizBrain = QuizBrain()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI(result: nil)
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let answerStrValue = sender.titleLabel?.text else {return}
        
        if quizBrain.checkAnswer(userAnswer: answerStrValue) && quizBrain.questionIndex < quizBrain.quiz.count {
            sender.backgroundColor = UIColor.green
        }else {
            sender.backgroundColor = UIColor.red
        }
        
        if quizBrain.questionIndex < quizBrain.quiz.count - 1 {
            quizBrain.incrementQuestionIndex()
            updateUI(result: nil)
            return
        }
        
        quizBrain.incrementQuestionIndex()
        let finalScore = "\(quizBrain.rightAnswers)/\(quizBrain.questionIndex)\nGreat Job!"
        updateUI(result: finalScore)
    }
    
    @IBAction func restartPressed(_ sender: UIButton) {
        quizBrain.resetQuiz()
        updateUI(result: nil)
        toggleButtonsVisibility(hidden: false)
    }
    
    func updateUI(result : String?) {
        if quizBrain.questionIndex == quizBrain.quiz.count{
            progressBarView.setProgress(quizBrain.getProgress(), animated: true)
            self.questionLabel.text = result!
            toggleButtonsVisibility(hidden: true)
            return
        }
        
        let res = quizBrain.getCurrentQuestion()
        // here we retrieve question and possible answers
        let questionText = res.0
        let questionAnswers = res.1
        
        self.questionLabel.text = questionText
        
        // here we set the answers
        self.firstButton.setTitle(questionAnswers[0], for: .normal)
        self.secondButton.setTitle(questionAnswers[1], for: .normal)
        self.thirdButton.setTitle(questionAnswers[2], for: .normal)

        
        // here we set the progress
        progressBarView.setProgress(quizBrain.getProgress(), animated: true)
                
        // here we put a delay for updating UI
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false)  { (Timer) in
            self.firstButton.backgroundColor = UIColor.clear
            self.secondButton.backgroundColor = UIColor.clear
            self.thirdButton.backgroundColor = UIColor.clear
            Timer.invalidate()
        }
    }
    
    
    func toggleButtonsVisibility(hidden : Bool) {
        self.firstButton.isHidden = hidden
        self.secondButton.isHidden = hidden
        self.thirdButton.isHidden = hidden
        self.restartButton.isHidden = !hidden
    }
}

