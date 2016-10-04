//
//  ViewController.swift
//  Quiz
//
//  Created by Andrew Barber on 10/4/16.
//  Copyright © 2016 Invictus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    @IBAction func questionButton(_ sender: AnyObject) {
        
        self.currentQuestionIndex = self.currentQuestionIndex + 1
        if self.currentQuestionIndex == self.questions.count {
            self.currentQuestionIndex = 0
        }
        
        let question = self.questions[self.currentQuestionIndex]
        self.questionLabel.text = question
        self.answerLabel.text = "???"
        animatedLabelTransitions()
    }
    
    @IBAction func answerButton(_ sender: AnyObject) {
        
        let answer = self.answers[self.currentQuestionIndex]
        self.answerLabel.text = answer
        
    }
    
    
    var questions = [String]()
    var answers = [String]()
    var currentQuestionIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.questions = ["What is your name?", "What is your quest?", "What is your favorite color?"]
        self.answers = ["Sir Galahad of Camelot", "I seek the Grail", "Blue, No, yel-"]
        
        self.questionLabel.text = self.questions[self.currentQuestionIndex]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.questionLabel.alpha = 0.0
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func animatedLabelTransitions() {
    
        UIView.animate(withDuration: 2.3) {
            self.questionLabel.alpha = 1.0
        }
    
    }
    
    
}

