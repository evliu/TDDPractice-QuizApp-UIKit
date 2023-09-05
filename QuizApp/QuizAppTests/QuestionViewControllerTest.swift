//
//  QuestionViewControllerTest.swift
//  QuizApp
//
//  Created by Everest Liu on 9/5/23.
//

@testable import QuizApp
import XCTest

class QuestionViewControllerTest: XCTestCase {
	func test_viewDidLoad_rendersQuestionHeaderText() {
		let sut = QuestionViewController(question: "Q1", options: [])
		sut.loadViewIfNeeded()

		XCTAssertEqual(sut.headerLabel.text, "Q1")
	}

	func test_viewDidLoad_withNoOptions_rendersZeroOptions() {
		let sut = QuestionViewController(question: "Q1", options: [])
		sut.loadViewIfNeeded()

		XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 0)
	}

	func test_viewDidLoad_withOneOption_rendersOneOption() {
		let sut = QuestionViewController(question: "Q1", options: ["A1"])
		sut.loadViewIfNeeded()

		XCTAssertEqual(sut.tableView.numberOfRows(inSection: 0), 1)
	}

	func test_viewDidLoad_withOneOption_rendersOneOptionText() {
		let sut = QuestionViewController(question: "Q1", options: ["A1"])
		sut.loadViewIfNeeded()

		let indexPath = IndexPath(row: 0, section: 0)
		let cell = sut.tableView.dataSource?.tableView(sut.tableView, cellForRowAt: indexPath)

		XCTAssertEqual(cell?.textLabel?.text, "A1")
	}
}