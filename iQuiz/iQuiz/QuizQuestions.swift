//
//  QuizQuestions.swift
//  iQuiz
//
//  Created by Maansi Surve on 5/5/25.
//

import Foundation

struct Quiz: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let icon: String
    let questions: [Question]
}

struct Question: Identifiable {
    let id = UUID()
    let text: String
    let answers: [String]
    let correctAnswerIndex: Int
}

class QuizData {
    static let quizzes: [Quiz] = [
        Quiz(
            title: "Mathematics",
            description: "All about square roots.",
            icon: "function",
            questions: [
                Question(
                    text: "What is the square root of 16?",
                    answers: ["2", "4", "8", "16"],
                    correctAnswerIndex: 1
                ),
                Question(
                    text: "What is the square root of 81?",
                    answers: ["7", "8", "9", "10"],
                    correctAnswerIndex: 2
                ),
                Question(
                    text: "What is the square root of 144?",
                    answers: ["10", "12", "14", "16"],
                    correctAnswerIndex: 1
                )
            ]
        ),
        
        Quiz(
            title: "Marvel Super Heroes",
            description: "Test your knowledge of Spider-Man.",
            icon: "bolt.fill",
            questions: [
                Question(
                    text: "What is Spider-Man's real name?",
                    answers: ["Peter Parker", "Miles Morales", "Gwen Stacy", "Ben Reilly"],
                    correctAnswerIndex: 0
                ),
                Question(
                    text: "Who is Spider-Man's famous nemesis with a symbiote?",
                    answers: ["Green Goblin", "Venom", "Doctor Octopus", "Mysterio"],
                    correctAnswerIndex: 1
                ),
                Question(
                    text: "In which comic did Spider-Man first appear?",
                    answers: ["Amazing Fantasy #15", "The Amazing Spider-Man #1", "Marvel Tales #1", "Web of Spider-Man #1"],
                    correctAnswerIndex: 0
                )
            ]
        ),
        
        Quiz(
            title: "Science",
            description: "Confident about chemical elements?",
            icon: "atom",
            questions: [
                Question(
                    text: "What is the chemical symbol for Gold?",
                    answers: ["Go", "Gd", "Au", "Ag"],
                    correctAnswerIndex: 2
                ),
                Question(
                    text: "Which element has the atomic number 1?",
                    answers: ["Helium", "Hydrogen", "Oxygen", "Lithium"],
                    correctAnswerIndex: 1
                ),
                Question(
                    text: "What is the most abundant element in the Earth's atmosphere?",
                    answers: ["Oxygen", "Carbon Dioxide", "Nitrogen", "Argon"],
                    correctAnswerIndex: 2
                )
            ]
        )
    ]
}
