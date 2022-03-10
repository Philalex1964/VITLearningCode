//
//  UnitTestsP39UITests.swift
//  UnitTestsP39UITests
//
//  Created by Aleksandar Filipov on 3/7/22.
//

import XCTest

class UnitTestsP39UITests: XCTestCase {

    override func setUpWithError() throws {

        continueAfterFailure = false

    }

    override func tearDownWithError() throws {

    }

    func testInitialStateIsCorrect() {
        let app = XCUIApplication()
        app.launch()
        
        let table = XCUIApplication().tables
        XCTAssertEqual(table.cells.count, 7, "There should be 7 rows initially")
    }
    
    func testUserFilteringString() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["Search"].tap()
        let filterAlert = app.alerts
        let textField = filterAlert.textFields.element
        textField.typeText("test")

        filterAlert.buttons["Filter"].tap()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            XCTAssertEqual(app.tables.cells.count, 56, "There should be 56 words matching 'test'")
        }
    }

    /*
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
*/
    /*
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
     */
}
