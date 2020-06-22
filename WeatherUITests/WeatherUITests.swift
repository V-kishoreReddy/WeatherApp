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
   
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
