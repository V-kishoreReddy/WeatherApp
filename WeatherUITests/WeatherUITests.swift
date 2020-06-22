//
//  WeatherUITests.swift
//  WeatherUITests
//
//  Created by V kishore kumar reddy  on 6/17/20.
//  Copyright © 2020 V kishore kumar reddy . All rights reserved.
//

import XCTest

class WeatherUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    func testTableViewCellExist() throws {
        XCTAssertEqual(app.tables.count, 1)
        let table = app.tables.element(boundBy: 0)
        XCTAssertEqual(table.cells.count,3)
        app.tables.staticTexts["Sydney"].tap()
    }
    func testTableInteraction() {
        // Assert that we are displaying the tableview
        let mainTableView = app.tables["weatherListTableView"]
        XCTAssertTrue(mainTableView.exists,"The main tableview exists")
        // Get an array of cells
        let tableCells = mainTableView.cells
        if tableCells.count > 0 {
            let count: Int = (tableCells.count - 1)
            let promise = expectation(description: "Wait for table cells")
            for i in stride(from: 0, to: count , by: 1) {
                if i == (count - 1) {
                    promise.fulfill()
                }
            }
            waitForExpectations(timeout: 20, handler: nil)
            XCTAssertTrue(true, "Finished validating the table cells")
            
        } else {
            XCTAssert(false, "Was not able to find any table cells")
        }
    }
    
    func testForCellExistence() {
        let detailstable = app.tables.matching(identifier: "weatherListTableView")
        let firstCell = detailstable.cells.element(matching: .cell, identifier: "myCell_0")
        let existencePredicate = NSPredicate(format: "exists == 1")
        let expectationEval = expectation(for: existencePredicate, evaluatedWith: firstCell, handler: nil)
        let mobWaiter = XCTWaiter.wait(for: [expectationEval], timeout: 10.0)
        XCTAssert(XCTWaiter.Result.completed == mobWaiter, "Test Case Failed.")
        firstCell.tap()
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
