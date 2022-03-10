//
//  UnitTestsP39Tests.swift
//  UnitTestsP39Tests
//
//  Created by Aleksandar Filipov on 3/7/22.
//

import XCTest
@testable import UnitTestsP39

class UnitTestsP39Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testAllWordsLoaded() {
        let playData = PlayData()
        XCTAssertEqual(playData.allWords.count, 18440, "allWords was not 18440")
    }
    
    func testWordCountsAreCorrect() {
        let playData = PlayData()
        XCTAssertEqual(playData.wordCounts.count(for: "home"), 174, "Home does not appear 174 times")
        XCTAssertEqual(playData.wordCounts.count(for: "slain"), 18, "Slain does not appear 18 times")
        XCTAssertEqual(playData.wordCounts.count(for: "answer"), 177, "Answer does not appear 177 times")
    }
    
    func testWordsLoadQuickly() {
        measure {
            _ = PlayData()
        }
    }
    
    func testUserFilterWorks() {
        let playData = PlayData()

        playData.applyUserFilter("100")
        XCTAssertEqual(playData.filteredWords.count, 495, "Words with 100 repetitions amount is not equal to 495")

        playData.applyUserFilter("1000")
        XCTAssertEqual(playData.filteredWords.count, 55, "Words with 1000 repetitions amount is not equal to 55")

        playData.applyUserFilter("10000")
        XCTAssertEqual(playData.filteredWords.count, 1, "Words with 10000 repetitions amount is not equal to 1")

        playData.applyUserFilter("test")
        XCTAssertEqual(playData.filteredWords.count, 56, "Test does not appear 56 times")

        playData.applyUserFilter("swift")
        XCTAssertEqual(playData.filteredWords.count, 7, "Swift does not appear 7 times")

        playData.applyUserFilter("objective-c")
        XCTAssertEqual(playData.filteredWords.count, 0, "Objective-c does not appear 0 times")
    }
}
