//
//  ScoreViewController.swift
//  iOS QUIZ
//
//  Created by admin on 07/12/2021.
//

import UIKit

class ScoreViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    var txt = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textLabel.text = txt
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
