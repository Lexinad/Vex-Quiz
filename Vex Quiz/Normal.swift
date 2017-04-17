//
//  Normal.swift
//  Vex Quiz
//  This class handles the Normal ViewController
//
//  Created by Daniel Gutierrez on 4/16/17.
//  Copyright © 2017 Daniel Gutierrez. All rights reserved.
//

import UIKit

struct Question {
    var question: String!
    var answers: [String]!
    var answer: Int!
}

class Normal: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    var questions = [Question]()
    var questionNumber = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let question1 = Question(question: "How much is that doggy in the window?", answers: ["$1", "$5", "$10", "$40"], answer: 3)
        let question2 = Question(question: "What is the best soda?", answers: ["Mist TWST", "Sprite", "7UP", "Root Beer"], answer: 0)
        questions = [question1, question2]
        
        selectQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func selectQuestion() {
        if questions.count > 0 {
            questionNumber = 0
            questionLabel.text = questions[questionNumber].question
            
            for i in 0..<buttons.count {
                buttons[i].setTitle(questions[questionNumber].answers[i], for: UIControlState.normal)
            }
            questions.remove(at: questionNumber)
        }
    }
    
    
    @IBAction func btn1Click(_ sender: UIButton) {
        
    }
    
    @IBAction func btn2Click(_ sender: UIButton) {
        
    }
    
    
    @IBAction func btn3Click(_ sender: UIButton) {
        
    }
    
    
    @IBAction func btn4Click(_ sender: UIButton) {
        
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
