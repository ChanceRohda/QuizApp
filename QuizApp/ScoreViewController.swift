//
//  ScoreViewController.swift
//  QuizApp
//
//  Created by Chance Rohda on 3/13/22.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var goodjobLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    var score: Int = 0
    weak var viewControllerClass: ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score: \(score)"
        if score == 6 {
            goodjobLabel.text = "Perfect!"
        }
        if score == 5 {
            goodjobLabel.text = "Nice Job!"
        }
        if score == 4 {
            goodjobLabel.text = "Good!"
        }
        if score == 3 {
            goodjobLabel.text = "Almost There!"
        }
        if score == 2 {
            goodjobLabel.text = "Try Again!"
        }
        if score == 1 {
            goodjobLabel.text = "Really?"
        }
        if score == 0 {
            goodjobLabel.text = ":("
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func acceptButtonDidTouch(_ sender: Any) {
        viewControllerClass?.resetQuiz()
        dismiss(animated: true, completion: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        viewControllerClass?.resetQuiz()
        dismiss(animated: true, completion: nil)
    }

}
