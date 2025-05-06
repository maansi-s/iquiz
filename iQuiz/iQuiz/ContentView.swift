//
//  ContentView.swift
//  iQuiz
//
//  Created by Maansi Surve on 5/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showSettings = false
    @StateObject private var questionHandler = QuizQuestionHandler()
    
    var body: some View {
        NavigationView {
            List(QuizData.quizzes) { quiz in
                NavigationLink(destination: QuizView(quiz: quiz, questionHandler: questionHandler)) {
                    QuizRowView(quiz: quiz)
                }
            }
            .navigationTitle("iQuiz 🤓")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showSettings = true
                    }) {
                        Image(systemName: "gear")
                    }
                }
            }
            .alert("Settings", isPresented: $showSettings) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Settings go here")
            }
        }
    }
}

struct QuizRowView: View {
    let quiz: Quiz
    
    var body: some View {
        HStack {
            Image(systemName: quiz.icon)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundColor(.red)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                Text(quiz.title)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(quiz.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    ContentView()
}
