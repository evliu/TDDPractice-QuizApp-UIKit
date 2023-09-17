//
//  ResultsPresenter.swift
//  QuizApp
//
//  Created by Everest Liu on 9/16/23.
//

import QuizEngine
import UIKit

struct ResultsPresenter {
	let result: Result<Question<String>, [String]>
	let correctAnswers: [Question<String>: [String]]
	var summary: String {
		return "You got \(result.score)/\(result.answers.count) correct"
	}

	var presentableAnswers: [PresentableAnswer] {
		return result.answers.map { question, userAnswer in
			guard let correctAnswer = correctAnswers[question] else {
				fatalError("correctAnswer for question: \(question) not found")
			}

			return presentableAnswer(question, userAnswer, correctAnswer)
		}
	}

	private func presentableAnswer(
		_ question: Question<String>,
		_ userAnswer: [String],
		_ correctAnswer: [String]
	) -> PresentableAnswer {
		switch question {
			case .singleAnswer(let q), .multipleAnswer(let q):
				return PresentableAnswer(
					question: q,
					answer: formattedAnswer(correctAnswer),
					wrongAnswer: formattedWrongAnswer(userAnswer, correctAnswer)
				)
		}
	}

	private func formattedAnswer(_ answer: [String]) -> String {
		return answer.joined(separator: ", ")
	}

	private func formattedWrongAnswer(_ userAnswer: [String], _ correctAnswer: [String]) -> String? {
		return correctAnswer == userAnswer ? nil : userAnswer.joined(separator: ", ")
	}
}