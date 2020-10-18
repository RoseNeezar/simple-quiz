//
//  Model.swift
//  QuizApp
//
//  Created by Rose Neezar on 18/10/2020.
//  Copyright © 2020 Gwinyai. All rights reserved.
//

import Foundation
import UIKit

struct QuizQuestion {
    var correctAnswer: Bool
    var question: String
    var image:UIImage
}

class Quiz {
   private var questions: [QuizQuestion] = [
        QuizQuestion(correctAnswer: true, question: "Is this a tree ?", image: UIImage(named: "tree")!),
        QuizQuestion(correctAnswer: false, question: "Is this a car ?", image: UIImage(named: "mug")!),
        QuizQuestion(correctAnswer: false, question: "Is this a mug ?", image: UIImage(named: "car")!),
    ]
    
    private var score: Int = 0
    private var questionIndex: Int = 0
    
    func getScore() -> String {
        return "\(score) \\ \(questions.count )"
    }
    
    func getQuestion() -> QuizQuestion {
        return questions[questionIndex]
    }
    func check(check:Bool) -> Bool {
        let question = getQuestion()
        if check == question.correctAnswer {
            score += 1
            return true
        }
        return false
    }
    
    func nextQuestion()-> Bool {
        questionIndex += 1
        if questionIndex > questions.count - 1 {
            return false
        }
        return true
    }
    func reset()  {
        questionIndex = 0
        score = 0
    }
}
