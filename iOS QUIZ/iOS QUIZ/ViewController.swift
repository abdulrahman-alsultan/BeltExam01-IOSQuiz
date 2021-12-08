//
//  ViewController.swift
//  iOS QUIZ
//
//  Created by admin on 07/12/2021.
//

import UIKit


struct Dataset{
    var questionString: String
    var correctAnswer: Int
    var answerA: String
    var answerB: String
    var answerC: String
    var answerD: String
}


struct QuizData{
    static var data = [
        Dataset(
            questionString: "Who was one of the creators of the swift language?",
            correctAnswer: 1,
            answerA: "Steve Jobs",
            answerB: "Chris Lattner",
            answerC: "Steve wozniak",
            answerD: "Ronald Wayne"
        ),
        Dataset(
            questionString: "Apple was created in what year?",
            correctAnswer: 0,
            answerA: "1976",
            answerB: "1989",
            answerC: "1990",
            answerD: "2002"
        ),
        Dataset(
            questionString: "The first iPhone was released on what year?",
            correctAnswer: 0,
            answerA: "June 2007",
            answerB: "October 2010",
            answerC: "May 2011",
            answerD: "June 2011"
        ),
        Dataset(
            questionString: "The current iPhone has 6GB RAM. The first iPhone had how much RAM?",
            correctAnswer: 2,
            answerA: "1 GB",
            answerB: "3 GB",
            answerC: "128 MB",
            answerD: "It had no RAM"
        ),
        Dataset(
            questionString: "when was Objective-C Created?",
            correctAnswer: 3,
            answerA: "1961",
            answerB: "1976",
            answerC: "1980",
            answerD: "1984"
        ),
    ]
}

struct QuizBank{
    static var quizzes = [QuizData]()
}



class ViewController: UIViewController {

    // define buttons to add border
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var thirdBtn: UIButton!
    @IBOutlet weak var fourthBtn: UIButton!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    
    
    var score = 0 // score for correct answer
    var currentQuestion = 0
    var isAnswerCorrect = false // to pass it to another view controller
    var correctAnswer = ""
    
    @IBOutlet weak var progress: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addBorder(btn: firstBtn)
        addBorder(btn: secondBtn)
        addBorder(btn: thirdBtn)
        addBorder(btn: fourthBtn)
        playAgain.isHidden = true
        
        // start quiz
        moveToQuestion()
    }

    // add border programmatically
    func addBorder(btn: UIButton){
        btn.layer.cornerRadius = 12
        btn.layer.borderWidth = 2
        btn.layer.borderColor = UIColor.white.cgColor
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        if currentQuestion < QuizData.data.count{
            isAnswerCorrect = false
            if sender.tag - 1 == QuizData.data[currentQuestion].correctAnswer{
                score += 1
                isAnswerCorrect = true
            }
            switch(QuizData.data[currentQuestion].correctAnswer){
            case 0: correctAnswer = QuizData.data[currentQuestion].answerA
            case 1: correctAnswer = QuizData.data[currentQuestion].answerB
            case 2: correctAnswer = QuizData.data[currentQuestion].answerC
            case 3: correctAnswer = QuizData.data[currentQuestion].answerD
            default: print("")
            }
            currentQuestion += 1
            moveToQuestion()
        }
    }
    
    
    @IBAction func playAgaiinClicked(_ sender: Any) {
        score = 0
        currentQuestion = 0
        isAnswerCorrect = false
        correctAnswer = ""
        playAgain.isHidden = true
        moveToQuestion()
    }
    
    func moveToQuestion(){
        if currentQuestion < QuizData.data.count{
            progress.progress = Float(currentQuestion) / Float(QuizData.data.count)
            let current =  QuizData.data[currentQuestion]
            question.text = current.questionString
            firstBtn.setTitle(current.answerA, for: .normal)
            secondBtn.setTitle(current.answerB, for: .normal)
            thirdBtn.setTitle(current.answerC, for: .normal)
            fourthBtn.setTitle(current.answerD, for: .normal)
            
            
            if currentQuestion != 0{
                performSegue(withIdentifier: "display_the_answer", sender: self)
            }
        }
        else{
            performSegue(withIdentifier: "display_the_score", sender: self)
            playAgain.isHidden = false
            progress.progress = 1.0
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if currentQuestion == QuizData.data.count{
            let vc = segue.destination as! ScoreViewController
            vc.txt = "Your score is: \(score) out of \(QuizData.data.count)."
        }
        else{
            let vc = segue.destination as! ShowAnswerViewController
            vc.correctAnswer = isAnswerCorrect
            vc.txt = correctAnswer
            vc.score = score
        }
    }

}

