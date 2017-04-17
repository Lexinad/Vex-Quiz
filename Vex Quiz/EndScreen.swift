//
//  EndScreen.swift
//  Vex Quiz
//
//  Created by Daniel Gutierrez on 4/16/17.
//  Copyright © 2017 Daniel Gutierrez. All rights reserved.
//

import UIKit

class EndScreen: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    var score = 5
    var questionCount = 20
    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "Score: \(score)/\(questionCount)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
