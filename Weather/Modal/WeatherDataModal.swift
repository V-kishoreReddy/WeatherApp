//
//  WeatherDataModal.swift
//  Weather
//
//  Created by V kishore kumar reddy  on 6/17/20.
//  Copyright © 2020 V kishore kumar reddy . All rights reserved.
//

import Foundation
import SwiftyJSON
struct WeatherDataModal {
    var name: String = ""
    var main: CityTemperatureData?
    
    init(json:JSON) {
        name = json["name"].stringValue
        main = CityTemperatureData(temperatureJson: json["main"])
        
    }
}
struct CityTemperatureData{
    var temp: String = ""
    var feels_like: String = ""
    var temp_min: String = ""
    var temp_max: String = ""
    var  pressure: String = ""
    var humidity: String = ""
    
    init(temperatureJson:JSON) {
        temp = temperatureJson["temp"].stringValue
        feels_like = temperatureJson["feels_like"].stringValue
        temp_min = temperatureJson["temp_min"].stringValue
        temp_max = temperatureJson["temp_max"].stringValue
        pressure = temperatureJson["pressure"].stringValue
        humidity = temperatureJson["humidity"].stringValue
    }
}
