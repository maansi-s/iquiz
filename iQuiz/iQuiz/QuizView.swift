//
//  QuizView.swift
//  iQuiz
//
//  Created by Maansi Surve on 5/5/25.
//

import SwiftUI

struct QuizView: View {
    let quiz: Quiz
    @ObservedObject var questionHandler: QuizQuestionHandler
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            if !questionHandler.quizCompleted {
                questionView
            }
        }
        .navigationTitle(quiz.title)
        .alert("Quiz Completed!", isPresented: $questionHandler.showingScore) {
            Button("Back to Quizzes", role: .cancel) {
                presentationMode.wrappedValue.dismiss()
                questionHandler.reset()
            }
        } message: {
            Text("Your score: \(questionHandler.score)/\(quiz.questions.count)")
        }
        .onAppear {
            questionHandler.reset()
        }
    }
    
    var questionView: some View {
        VStack(spacing: 20) {
            Text(quiz.questions[questionHandler.currentQuestionIndex].text)
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            
            ForEach(0..<quiz.questions[questionHandler.currentQuestionIndex].answers.count, id: \.self) { index in
                Button(action: {
                    questionHandler.checkAnswer(
                        question: quiz.questions[questionHandler.currentQuestionIndex],
                        selectedAnswerIndex: index
                    )
                    questionHandler.moveToNextQuestion(totalQuestions: quiz.questions.count)
                }) {
                    Text(quiz.questions[questionHandler.currentQuestionIndex].answers[index])
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color(.systemBackground))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    NavigationView {
        QuizView(
            quiz: QuizData.quizzes[0],
            questionHandler: QuizQuestionHandler()
        )
    }
}
