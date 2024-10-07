//
//  MovieWatchListUITesting.swift
//  MovieWatchListUITesting
//
//  Created by Olga Nazarov on 10/7/24.
//

import XCTest

class MovieWatchListUITesting: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testAddMovie() throws {
        // Tap the add button
        let addButton = app.navigationBars["Movie Watchlist"].buttons["Add"]
        XCTAssertTrue(addButton.waitForExistence(timeout: 5))
        addButton.tap()
        
        // Fill in the movie details
        let titleTextField = app.textFields["Title"]
        XCTAssertTrue(titleTextField.waitForExistence(timeout: 5))
        
        // Force focus and type
        titleTextField.tap()
        titleTextField.typeText("Inception")
        
        if titleTextField.value as? String != "Inception" {
            // If typing failed, try an alternative method
            titleTextField.tap()
            titleTextField.press(forDuration: 1.0)
            app.menuItems["Select All"].tap()
            app.menuItems["Cut"].tap()
            titleTextField.typeText("Inception")
        }
        
        // Rest of the test remains the same...
    }
}
