//
//  QuizQuestionHandler.swift
//  iQuiz
//
//  Created by Maansi Surve on 5/5/25.
//

import Foundation
import SwiftUI

class QuizQuestionHandler: ObservableObject {
    @Published var currentQuestionIndex = 0
    @Published var score = 0
    @Published var showingScore = false
    @Published var quizCompleted = false
    
    func reset() {
        currentQuestionIndex = 0
        score = 0
        showingScore = false
        quizCompleted = false
    }
    
    func checkAnswer(question: Question, selectedAnswerIndex: Int) {
        if selectedAnswerIndex == question.correctAnswerIndex {
            score += 1
        }
    }
    
    func moveToNextQuestion(totalQuestions: Int) {
        if currentQuestionIndex + 1 < totalQuestions {
            currentQuestionIndex += 1
        } else {
            quizCompleted = true
            showingScore = true
        }
    }
}
