//
//  ShowAnswerViewController.swift
//  iOS QUIZ
//
//  Created by admin on 07/12/2021.
//

import UIKit

class ShowAnswerViewController: UIViewController {

    @IBOutlet weak var answer: UILabel!
    
    var correctAnswer = false
    var txt = ""
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if correctAnswer{
            answer.text = "\(txt)\nCORRECT!\nSCORE: \(score)"
            view.backgroundColor = UIColor.blue
        }
        else{
            answer.text = "NOT QUITE"
            view.backgroundColor = UIColor.black
        }
        
    }

}
