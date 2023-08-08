//
//  Question.swift
//  Quizzler
//
//  Created by Burak Karasel on 7.08.2023.
//

import Foundation

struct Question {
    let text : String
    let answers : [String]
    let correctAnswer : String
    
    init(q: String, a: [String], ca : String) {
        self.text = q
        self.answers = a
        self.correctAnswer = ca
    }
}

