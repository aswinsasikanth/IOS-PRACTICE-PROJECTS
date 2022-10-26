//
//  ViewController.swift
//  Quizz-APP-Term Project-1
//
//  Created by Aswin Sasikanth Kanduri on 2022-10-25.
//


import UIKit
import GameKit



class ViewController: UIViewController {

    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var correctIncorrectMsg: UILabel!
    @IBOutlet weak var firstChoiceBtn: UIButton!
    @IBOutlet weak var secondChoiceBtn: UIButton!
    @IBOutlet weak var thirdChoiceBtn: UIButton!
    @IBOutlet weak var fourthChoiceBtn: UIButton!
    @IBOutlet weak var nextQuestionBtn: UIButton!

    
    
    var questionList = [Question]()
    let score = Score()
    
    var previousUsedNumbers: [Int] = []
    let numberOfQuestionPerRound = 3
    var currentQuestion: Question? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    filldata()
    displayQuestion()
    }
    
    
    func filldata()   {
        questionList.append(Question(questionTitle: "Who am I?", answers: ["Man", "Woman", "Kid", "God"], correctAnswersIndex: 3))
        questionList.append(Question(questionTitle: "Humans orginated from?", answers: ["Ape", "Monkey", "None", "Lion"], correctAnswersIndex: 2))
        questionList.append(Question(questionTitle: "Where is India?", answers: ["Earth", "Mars", "Pluto", "Neptune"], correctAnswersIndex: 0))
        
    }
    func getRandomQuestion() -> Question {
        if(previousUsedNumbers.count == questionList.count){
            previousUsedNumbers = []
        }
        var randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: questionList.count)
        
        while(previousUsedNumbers.contains(randomNumber)){
            var randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: questionList.count)
        }
        previousUsedNumbers.append(randomNumber)
        return questionList[randomNumber]
    }
    
    
    func displayQuestion() {
        currentQuestion = getRandomQuestion()
        if let question = currentQuestion {
            let choice = question.getChoice()
            questionText.text = question.getQuestionTitle()
            
            firstChoiceBtn.setTitle(choice[0], for: .normal)
            secondChoiceBtn.setTitle(choice[1], for: .normal)
            thirdChoiceBtn.setTitle(choice[2], for: .normal)
            fourthChoiceBtn.setTitle(choice[3], for: .normal)
            
            if(score.numberOfQuestionsAsked() == numberOfQuestionPerRound - 1) {
                nextQuestionBtn.setTitle("End Quiz", for: .normal)
            } else { nextQuestionBtn.setTitle("Next Question", for: .normal)}

        }
        
        
        firstChoiceBtn.isEnabled = true
        secondChoiceBtn.isEnabled = true
        thirdChoiceBtn.isEnabled = true
        fourthChoiceBtn.isEnabled = true
        
        firstChoiceBtn.isHidden = false
        secondChoiceBtn.isHidden = false
        thirdChoiceBtn.isHidden = false
        fourthChoiceBtn.isHidden = false
        correctIncorrectMsg.isHidden = true
        
        nextQuestionBtn.isEnabled = false
    }
    

    @IBAction func checkAnswer(_ sender: UIButton) {
        
        if let question = currentQuestion,
            let answer = sender.titleLabel?.text {
            if(question.validateAnswer(to: answer)) {
                score.incrementCorrectAnswers()
                correctIncorrectMsg.textColor = .green
                correctIncorrectMsg.text = "Correct Answer!"
            }
            else {
                score.incrementIncorrectAnswers()
                correctIncorrectMsg.textColor = .red
                correctIncorrectMsg.text = "Incorrect Answer!"
            }
            
            firstChoiceBtn.isEnabled = false
            secondChoiceBtn.isEnabled = false
            thirdChoiceBtn.isEnabled = false
            fourthChoiceBtn.isEnabled = false
            
            correctIncorrectMsg.isHidden = false
            nextQuestionBtn.isEnabled = true
        }
    }
    
    func isGameOver() -> Bool {
        return score.numberOfQuestionsAsked() >= numberOfQuestionPerRound
    }
    
    func displayScore() {
        questionText.text = score.getScore()
        score.reset()
        nextQuestionBtn.setTitle("Start again", for: .normal)
        
        correctIncorrectMsg.isHidden = true
        firstChoiceBtn.isHidden = true
        secondChoiceBtn.isHidden = true
        thirdChoiceBtn.isHidden = true
        fourthChoiceBtn.isHidden = true
    }
    
    
    @IBAction func nextQuestionBtnClick(_ sender: UIButton){
        
        if  (isGameOver()) {
            displayScore()
        }
        else {
            displayQuestion()
        }
        
    }
    
}

