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
    var answerNumber = Int()
    var score: Int = 0
    var originalQuestionCount = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let question1 = Question(question: "How much is that doggy in the window?", answers: ["$1", "$5", "$10", "$40"], answer: 3)
        let question2 = Question(question: "What is the best soda?", answers: ["Mist TWST", "Sprite", "7UP", "Root Beer"], answer: 0)
        questions = [question1, question2]
        originalQuestionCount = questions.count
        
        selectQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func selectQuestion() {
        if questions.count > 0 {
            questionNumber = Int(arc4random_uniform(UInt32(questions.count)))
            questionLabel.text = questions[questionNumber].question
            answerNumber = questions[questionNumber].answer
            
            for i in 0..<buttons.count {
                buttons[i].setTitle(questions[questionNumber].answers[i], for: UIControlState.normal)
            }
            questions.remove(at: questionNumber)
        } else {
            self.performSegue(withIdentifier: "Gameover", sender: self)
        }
    }
    
    
    @IBAction func btn1Click(_ sender: UIButton) {
        if answerNumber == 0 {
            score += 1
        }
        selectQuestion()
        
        
    }
    
    @IBAction func btn2Click(_ sender: UIButton) {
        if answerNumber == 1 {
            score += 1
        }
        selectQuestion()
        
    }
    
    
    @IBAction func btn3Click(_ sender: UIButton) {
        if answerNumber == 2 {
            score += 1
        }
        selectQuestion()
        
    }
    
    
    @IBAction func btn4Click(_ sender: UIButton) {
        if answerNumber == 3 {
            score += 1
        }
        selectQuestion()
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Gameover" {
            let destination = segue.destination as! EndScreen
            destination.score = score
            destination.questionCount = originalQuestionCount
        }
    }
 

}
