//
//  Normal.swift
//  Vex Quiz
//  This class handles the Normal ViewController
//
//  Created by Daniel Gutierrez on 4/16/17.
//  Copyright © 2017 Daniel Gutierrez. All rights reserved.
//

import UIKit
import AVFoundation

struct Question {
    var question: String!
    var answers: [String]!
    var answer: Int!
}


class Geography: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    var questions = [Question]()
    var questionNumber = Int()
    var answerNumber = Int()
    var score: Int = 0
    var originalQuestionCount = Int()
    var correctSound: AVAudioPlayer!
    var incorrectSound: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let correctSoundURL = Bundle.main.url(forResource: "Correct_Answer", withExtension: "wav")
        do {
            correctSound = try AVAudioPlayer(contentsOf: correctSoundURL!)
            correctSound.prepareToPlay()
        } catch {
            NSLog("Error playing correct sound!")
        }

        let incorrectSoundURL = Bundle.main.url(forResource: "Incorrect_Answer", withExtension: "wav")
        do {
            incorrectSound = try AVAudioPlayer(contentsOf: incorrectSoundURL!)
            incorrectSound.prepareToPlay()
        } catch {
            NSLog("Error playing incorrect sound!")
        }
        
        // Do any additional setup after loading the view.
        let question1 = Question(question: "The London Eye is found in what country?", answers: ["France", "Germany", "Switzerland", "England"], answer: 3)
        let question2 = Question(question: "Which of these countries touches the Euphrates River?", answers: ["Morocco", "Iraq", "Algeria", "Sudan"], answer: 1)
        let question3 = Question(question: "Which of these countries borders Slovakia", answers: ["Poland", "Albania", "Croatia", "Bulgaria"], answer: 0)
        let question4 = Question(question: "Which of these countries is NOT a Baltic country?", answers: ["Estonia", "Latvia", "Belarus", "Lithuania"], answer: 2)
        let question5 = Question(question: "The Ryukyu Islands are a part of which country?", answers: ["China", "Japan", "Korea", "The Philippines"], answer: 1)
        let question6 = Question(question: "The island of Naxos can be found in what country", answers: ["Greece", "Italy", "Turkey", "Albania"], answer: 0)
        let question7 = Question(question: "Managua is the capital of what country?", answers: ["El Salvador", "Panama", "Nicaragua", "Belize"], answer: 2)
        let question8 = Question(question: "", answers: ["", "", "", ""], answer: 3)
        let question9 = Question(question: "", answers: ["", "", "", ""], answer: 3)
        let question10 = Question(question: "", answers: ["", "", "", ""], answer: 1)
        
        questions = [question1, question2, question3, question4, question5, question6, question7, question8, question9, question10]
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
            correctSound.play()
        } else {
            incorrectSound.play()
        }
        selectQuestion()
        
        
    }
    
    @IBAction func btn2Click(_ sender: UIButton) {
        if answerNumber == 1 {
            score += 1
            correctSound.play()
        } else {
            incorrectSound.play()
        }
        selectQuestion()
        
    }
    
    
    @IBAction func btn3Click(_ sender: UIButton) {
        if answerNumber == 2 {
            score += 1
            correctSound.play()
        } else {
            incorrectSound.play()
        }
        selectQuestion()
        
    }
    
    
    @IBAction func btn4Click(_ sender: UIButton) {
        if answerNumber == 3 {
            score += 1
            correctSound.play()
        } else {
            incorrectSound.play()
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
