//
//  ViewController.swift
//  QuizApp
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var quesLbl: UILabel!
    
    let quiz = Quiz()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupQuestion()
    }
    
    func setupQuestion() {
        let currentQuestion = quiz.getQuestion()
        imgView.image = currentQuestion.image
        quesLbl.text = currentQuestion.question
    }
    
    @IBAction func trueBtn(_ sender: Any) {
        let result = quiz.check(check: true)
        showResult(isCorrect: result)
    }
    
    
    @IBAction func falseBtn(_ sender: Any) {
        let result = quiz.check(check: false)
        showResult(isCorrect: result)
    }
    
    func showResult(isCorrect correct:Bool)  {
        let title = correct ? "Correct" : "False"
        let alert = UIAlertController(title: title, message: title, preferredStyle: .alert)
        
        let nextQuestionAction = UIAlertAction(title: "Next question", style: .default) { (action) in
            
            if self.quiz.nextQuestion() {
                self.setupQuestion()
                alert.dismiss(animated: true, completion: nil)
            }
            else {
                alert.dismiss(animated: true, completion: nil)
                self.showFinalScore()
            }
            
        }
        
        alert.addAction(nextQuestionAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showFinalScore() {
        let alert = UIAlertController(title: "Final Score", message: quiz.getScore(), preferredStyle: .alert)
        let okbutton = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.quiz.reset()
            self.setupQuestion()
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okbutton)
        present(alert, animated: true, completion: nil)
    }
}

