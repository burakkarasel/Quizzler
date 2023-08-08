//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Burak Karasel on 8.08.2023.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], ca: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], ca: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], ca: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], ca: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], ca: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], ca: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], ca: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], ca: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], ca: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], ca: "Australia")
    ]
    
    var questionIndex = 0
    var rightAnswers = 0

    
    mutating func checkAnswer(userAnswer : String) -> Bool{
        if self.quiz[self.questionIndex].correctAnswer == userAnswer {
            self.rightAnswers += 1
            return true
        }
        return false
    }
    
    func getCurrentQuestion() -> (String, [String]) {
        return (self.quiz[self.questionIndex].text, self.quiz[self.questionIndex].answers)
    }
    
    func getProgress() -> Float {
        return Float(self.questionIndex) / Float(self.quiz.count)
    }
    
    mutating func incrementQuestionIndex() {
        self.questionIndex += 1
    }
    
    mutating func resetQuiz() {
        self.questionIndex = 0
        self.rightAnswers = 0
    }
}
