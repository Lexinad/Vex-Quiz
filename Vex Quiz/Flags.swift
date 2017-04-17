//
//  Flags.swift
//  Vex Quiz
//
//  Created by Daniel Gutierrez on 4/17/17.
//  Copyright © 2017 Daniel Gutierrez. All rights reserved.
//

import UIKit
import AVFoundation

struct FlagQuestion {
    var flag: UIImage!
    var answers: [String]!
    var answer: Int!
    
}

class Flags: UIViewController {

    @IBOutlet weak var flag: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    
    var questions = [FlagQuestion]()
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
        let q1 = FlagQuestion(flag: #imageLiteral(resourceName: "394px-Flag_of_Nepal.svg.png"), answers: ["Nepal", "Bangladesh", "India", "Pakistan"], answer: 0)
        let q2 = FlagQuestion(flag: #imageLiteral(resourceName: "640px-Flag_of_Australia.svg.png"), answers: ["Austria", "Austrailia", "New Zealand", "Vanatu"], answer: 1)
        let q3 = FlagQuestion(flag: #imageLiteral(resourceName: "640px-Flag_of_Bhutan.svg.png"), answers: ["Sri Lanka", "Nepal", "Bhutan", "China"], answer: 2)
        let q4 = FlagQuestion(flag: #imageLiteral(resourceName: "640px-Flag_of_Germany.svg.png"), answers: ["Switzerland", "Austria", "Belgium", "Germany"], answer: 3)
        let q5 = FlagQuestion(flag: #imageLiteral(resourceName: "640px-Flag_of_India.svg.png"), answers: ["India", "Nepal", "Georgia", "Turkmenistan"], answer: 0)
        let q6 = FlagQuestion(flag: #imageLiteral(resourceName: "640px-Flag_of_Sweden.svg.png"), answers: ["Finland", "Sweden", "Norway", "Denmark"], answer: 1)
        let q7 = FlagQuestion(flag: #imageLiteral(resourceName: "640px-Flag_of_Honduras.svg.png"), answers: ["Panama", "Peru", "Honduras", "El Salvador"], answer: 2)
        let q8 = FlagQuestion(flag: #imageLiteral(resourceName: "640px-Flag_of_Seychelles.svg.png"), answers: ["Madagascar", "Ethiopia", "Algeria", "Seychelles"], answer: 3)
        let q9 = FlagQuestion(flag: #imageLiteral(resourceName: "640px-Flag_of_Saudi_Arabia.svg.png"), answers: ["Saudi Arabia", "Iran", "Iraq", "Yemen"], answer: 0)
        let q10 = FlagQuestion(flag: #imageLiteral(resourceName: "640px-Flag_of_the_United_Kingdom.svg.png"), answers: ["France", "UK", "Belize", "Portugal"], answer: 1)
        
        
        questions = [q1, q2, q3, q4, q5, q6, q7, q8, q9, q10]
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
            flag.image = questions[questionNumber].flag
            answerNumber = questions[questionNumber].answer
            
            for i in 0..<buttons.count {
                buttons[i].setTitle(questions[questionNumber].answers[i], for: UIControlState.normal)
            }
            questions.remove(at: questionNumber)
        } else {
            self.performSegue(withIdentifier: "FlagGameOver", sender: self)
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
        if segue.identifier == "FlagGameOver" {
            let svc = segue.destination as! EndScreen
            svc.score = score
            svc.questionCount = originalQuestionCount
        }
    }
 

}
