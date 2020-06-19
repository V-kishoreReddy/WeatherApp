//
//  WeatherCityModal.swift
//  Weather
//
//  Created by V kishore kumar reddy  on 6/19/20.
//  Copyright © 2020 V kishore kumar reddy . All rights reserved.
//

import Foundation
import SwiftyJSON

struct WeatherCityModal {
    var id: String = ""
    var name : String = ""
    
    init(cityJosn:JSON) {
        id = cityJosn["id"].stringValue
        name = cityJosn["name"].stringValue
    }
}
