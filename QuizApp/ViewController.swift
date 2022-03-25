//
//  ViewController.swift
//  QuizApp
//
//  Created by Chance Rohda on 3/12/22.
//

import UIKit

class Question {
    var image: UIImage
    var correctAnswer: Int
    var firstAnswer: String
    var secondAnswer: String
    var thirdAnswer: String
    init(image:UIImage, correctAnswer: Int, firstAnswer: String, secondAnswer: String, thirdAnswer: String){
        self.image = image
        self.correctAnswer = correctAnswer
        self.firstAnswer = firstAnswer
        self.secondAnswer = secondAnswer
        self.thirdAnswer = thirdAnswer
    }
}



protocol ViewControllerDelegate: AnyObject {
    func resetQuiz()
}

class ViewController: UIViewController,  ViewControllerDelegate {

    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionImageView: UIImageView!
    
    var score: Int = 0
    var currentQuestion: Int = 0
    // This is the array that contains all of the questions and answers.
    var questions: [Question] = [Question(image: UIImage(named: "lion")!, correctAnswer: 2, firstAnswer: "Hippo", secondAnswer: "Lion", thirdAnswer: "Giraffe"),                             Question(image: UIImage(named: "orange")!, correctAnswer: 1, firstAnswer: "Orange", secondAnswer: "Apple", thirdAnswer: "Lemon"),                             Question(image: UIImage(named: "guitar")!, correctAnswer: 3, firstAnswer: "Drums", secondAnswer: "Trombone", thirdAnswer: "Guitar"),                   Question(image: UIImage(named: "swift")!, correctAnswer: 2, firstAnswer: "JavaScript", secondAnswer: "Swift", thirdAnswer: "Python"),                   Question(image: UIImage(named: "cat")!, correctAnswer: 1, firstAnswer: "Cat", secondAnswer: "Chihuahua", thirdAnswer: "Pig"),                   Question(image: UIImage(named: "clock")!, correctAnswer: 3, firstAnswer: "Calculator", secondAnswer: "Lamp", thirdAnswer: "Clock")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let question = questions[currentQuestion]
        firstAnswerButton.setTitle(question.firstAnswer, for: .normal)
        secondAnswerButton.setTitle(question.secondAnswer, for: .normal)
        thirdAnswerButton.setTitle(question.thirdAnswer, for: .normal)
        questionImageView.image = question.image
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ScoreViewController
        destinationVC.score = score
        destinationVC.viewControllerClass = self
        
    }
    
    func resetQuiz() {
        score = 0
        currentQuestion = 0
        let question = questions[0]
        firstAnswerButton.setTitle(question.firstAnswer, for: .normal)
        secondAnswerButton.setTitle(question.secondAnswer, for: .normal)
        thirdAnswerButton.setTitle(question.thirdAnswer, for: .normal)
        questionImageView.image = question.image
        scoreLabel.text = "Score: 0"
    }
    func nextQuestion() {
        
        if questions.count - 1  > currentQuestion {
            currentQuestion += 1
            let question = questions[currentQuestion]
            firstAnswerButton.setTitle(question.firstAnswer, for: .normal)
            secondAnswerButton.setTitle(question.secondAnswer, for: .normal)
            thirdAnswerButton.setTitle(question.thirdAnswer, for: .normal)
            questionImageView.image = question.image
        } else {
            performSegue(withIdentifier: "ScoreSegue", sender: nil)
        }
        
    }
    func check(answer: Int) {
        let question = questions[currentQuestion]
        
        if question.correctAnswer == answer {
            score += 1
            scoreLabel.text = "Score: \(score)"
            let alert = UIAlertController(title: "Correct!", message: "You got the correct answer!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { action in
                alert.dismiss(animated: true, completion: nil)
                self.nextQuestion()
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Wrong!", message: "You got the wrong answer!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { action in
                alert.dismiss(animated: true, completion: nil)
                self.nextQuestion()
            }
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func firstAnswerButtonDidTouch(_ sender: Any) {
        
        check(answer: 1)
    }
    
    @IBAction func secondAnswerButtonDidTouch(_ sender: Any) {
        check(answer: 2)
        
    }
    
    
    @IBAction func thirdAnswerButtonDidTouch(_ sender: Any) {
        check(answer: 3)
    }
}
