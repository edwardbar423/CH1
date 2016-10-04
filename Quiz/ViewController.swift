//
//  ViewController.swift
//  Quiz
//
//  Created by Andrew Barber on 10/4/16.
//  Copyright © 2016 Invictus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    
    @IBAction func questionButton(_ sender: AnyObject) {
        
        self.currentQuestionIndex = self.currentQuestionIndex + 1
        if self.currentQuestionIndex == self.questions.count {
            self.currentQuestionIndex = 0
        }
        
        let question = self.questions[self.currentQuestionIndex]
        self.nextQuestionLabel.text = question
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
        
        self.currentQuestionLabel.text = self.questions[self.currentQuestionIndex]
        
        self.updateOffScreenLabel()
        
    }
    
    func updateOffScreenLabel() {
        
        let screenWidth : CGFloat = self.view.frame.size.width
        self.nextQuestionLabelCenterXConstraint.constant = -screenWidth
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.nextQuestionLabel.alpha = 0.0
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func animatedLabelTransitions() {
    
        self.view.layoutIfNeeded()
        
        let screenWidth : CGFloat = self.view.frame.size.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [UIViewAnimationOptions.curveLinear], animations: {
            self.currentQuestionLabel.alpha = 0.0
            self.nextQuestionLabel.alpha = 1.0
            self.view.layoutIfNeeded()
            }) { (finished) in
                let tempLabel = self.currentQuestionLabel
                self.currentQuestionLabel = self.nextQuestionLabel
                self.nextQuestionLabel = tempLabel
                
                let tempConstraint = self.currentQuestionLabelCenterXConstraint
                self.currentQuestionLabelCenterXConstraint = self.nextQuestionLabelCenterXConstraint
                self.nextQuestionLabelCenterXConstraint = tempConstraint
                self.updateOffScreenLabel()
        }
    }
    
    
}

