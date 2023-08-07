//
//  Question.swift
//  Quizzler
//
//  Created by Burak Karasel on 7.08.2023.
//

import Foundation

struct Question {
    let text : String
    let answer : String
    
    init(q: String, a: String) {
        self.text = q
        self.answer = a
    }
}

