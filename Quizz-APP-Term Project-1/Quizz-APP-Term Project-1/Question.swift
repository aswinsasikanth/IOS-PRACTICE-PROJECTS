//
//  Question.swift
//  Quizz-APP-Term Project-1
//
//  Created by Aswin Sasikanth Kanduri on 2022-10-26.
//

import Foundation

class Question {
    
    let questionTitle: String
    let answers: [String]
    let correctAnswersIndex: Int
    
    init(questionTitle: String, answers: [String], correctAnswersIndex: Int) {
        
        self.questionTitle = questionTitle
        self.answers = answers
        self.correctAnswersIndex = correctAnswersIndex
    }
    
    func validateAnswer(to givenAnswer: String) -> Bool {
        return (givenAnswer == answers[correctAnswersIndex])
    }
    
    func getQuestionTitle() -> String {
        return questionTitle
    }
    
    func getAnswer() -> String {
        return answers[correctAnswersIndex]
    }
    
    func getChoice() -> [String] {
        return answers
    }
    
    func getAnswerAt(index: Int) -> String {
        return answers[index]
    }
    
    
}


class Score{
    
     var correctAnswers: Int = 0
     var incorrectAnswers: Int = 0
     var questionPerRound = 3
    
    func reset()  {
        correctAnswers = 0
        incorrectAnswers = 0
    }
    
    func incrementCorrectAnswers() {
        correctAnswers += 1
    }
    
    func incrementIncorrectAnswers() {
        incorrectAnswers += 1
    }
    
    func numberOfQuestionsAsked() -> Int {
        return correctAnswers + incorrectAnswers
    }
    
    func getScore() -> String {
        if (correctAnswers == 3) {
            return "Very Good!\n \n Score is  \(correctAnswers) for \(questionPerRound)"
        }
        else if (correctAnswers == 2) {
            return " Good!\n \n Score is  \(correctAnswers) for \(questionPerRound)"
        }
        else if (correctAnswers == 1) {
            return " Okay Okay!\n \n Score is  \(correctAnswers) for \(questionPerRound)"
        }
        
        else {
            return "Try again, Score is \(correctAnswers) for \(questionPerRound) "
        }
    }
    
    
}





























































