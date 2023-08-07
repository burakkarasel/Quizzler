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
        
    let quiz = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    var questionIndex = 0
    var rightAnswers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI(value: quiz[questionIndex].text, progress: questionIndex)
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard let answerStrValue = sender.titleLabel?.text else {return}
        let rightAnswer = quiz[questionIndex].answer
        
        if answerStrValue == rightAnswer && questionIndex < quiz.count {
            rightAnswers += 1
            sender.backgroundColor = UIColor.green
        }else {
            sender.backgroundColor = UIColor.red
        }
        
        if questionIndex < quiz.count - 1 {
            questionIndex += 1
            updateUI(value: quiz[questionIndex].text, progress: questionIndex)
            return
        }
        
        let score = Float(rightAnswers) / Float(quiz.count) * 100
        updateUI(value: "Your score is: \(score.rounded())", progress: quiz.count)
        toggleButtonsVisibility(hidden: true)
    }
    
    @IBAction func restartPressed(_ sender: UIButton) {
        questionIndex = 0
        rightAnswers = 0
        updateUI(value: quiz[questionIndex].text, progress: 0)
        toggleButtonsVisibility(hidden: false)
    }
    
    func updateUI(value : String, progress : Int) {
        progressBarView.setProgress(Float(progress) / Float(quiz.count), animated: true)
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

