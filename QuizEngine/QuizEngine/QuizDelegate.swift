//
//  QuizDelegate.swift
//  QuizEngine
//
//  Created by Everest Liu on 9/21/23.
//

import Foundation

public protocol QuizDelegate {
	associatedtype Question
	associatedtype Answer

	func answer(for question: Question, completion: @escaping (Answer) -> Void)

	func didCompleteQuiz(withAnswers: [(question: Question, answer: Answer)])
}
