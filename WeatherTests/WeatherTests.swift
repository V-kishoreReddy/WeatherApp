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
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        vc = storyboard.instantiateViewController(withIdentifier: "WeatherListViewController")as! WeatherListViewController
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
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
    
//    func testCityDataNotNil() {
//        let city = weatherViewModal.cityArrayData[1]
//        XCTAssertNotNil(city)
//        XCTAssertEqual(city.id, "14256")
//        XCTAssertEqual(city.name, "Azadshahr")
//    }
    
}
