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
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
    var timer = Timer()
        
    var quizBrain = QuizBrain()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI(value: quizBrain.getCurrentQuestion(), progress: quizBrain.getProgress())
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let answerStrValue = sender.titleLabel?.text else {return}
        
        if quizBrain.checkAnswer(userAnswer: answerStrValue) && quizBrain.questionIndex < quizBrain.quiz.count {
            sender.backgroundColor = UIColor.green
        }else {
            sender.backgroundColor = UIColor.red
        }
        
        if quizBrain.questionIndex < quizBrain.quiz.count - 1 {
            updateUI(value: quizBrain.getNextQuestion(), progress: quizBrain.getProgress())
            return
        }
        
        quizBrain.incrementQuestionIndex()
        let finalScore = "\(quizBrain.rightAnswers)/\(quizBrain.questionIndex)\nGreat Job!"
        updateUI(value: finalScore, progress: quizBrain.getProgress())
        toggleButtonsVisibility(hidden: true)
    }
    
    @IBAction func restartPressed(_ sender: UIButton) {
        quizBrain.resetQuiz()
        updateUI(value: quizBrain.getCurrentQuestion(), progress: quizBrain.getProgress())
        toggleButtonsVisibility(hidden: false)
    }
    
    func updateUI(value : String, progress : Float) {
        progressBarView.setProgress(progress, animated: true)
        questionLabel.text = value
        // here we put a delay for updating UI
        timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false)  { (Timer) in
            self.trueButton.backgroundColor = UIColor.clear
            self.falseButton.backgroundColor = UIColor.clear
                        Timer.invalidate()
        }
    }
    
    func toggleButtonsVisibility(hidden : Bool) {
        self.falseButton.isHidden = hidden
        self.trueButton.isHidden = hidden
        self.restartButton.isHidden = !hidden
    }
}

