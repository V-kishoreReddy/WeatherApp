//
//  WeatherTests.swift
//  WeatherTests
//
//  Created by V kishore kumar reddy  on 6/17/20.
//  Copyright © 2020 V kishore kumar reddy . All rights reserved.
//

import XCTest
@testable import Weather

class WeatherTests: XCTestCase {
    var vc: WeatherListViewController!
    var sut: URLSession!
    var weatherViewModal = WeatherViewModal()
    
    override func setUp() {
        super.setUp()
        sut = URLSession(configuration: .default)
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    //  test: success of API
    func testWeatherListAPI(){
        let appDelegate : AppDelegate = AppDelegate().sharedInstance()
        let citylist = appDelegate.cityArray.joined(separator:",")
        let weather_listApi = URL(string:"\(base_url)group?id=\(citylist)&units=\(units)&appid=\(app_id)")
        let promise = expectation(description: "Completion handler invoked")
        var statusCode: Int?
        var responseError: Error?
        let dataTask = sut.dataTask(with: weather_listApi!) { data, response, error in
            statusCode = (response as? HTTPURLResponse)?.statusCode
            responseError = error
            promise.fulfill()
        }
        dataTask.resume()
        wait(for: [promise], timeout: 5)
        XCTAssertNil(responseError)
        XCTAssertEqual(statusCode, 200)
    }
    
}
