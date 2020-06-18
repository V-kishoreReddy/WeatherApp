//
//  WeatherConstants.swift
//  Weather
//
//  Created by V kishore kumar reddy  on 6/18/20.
//  Copyright © 2020 V kishore kumar reddy . All rights reserved.
//

import Foundation

let app_id = "b961fe44b69637dbe9449a3f63dcbb68"
let units = "metric"
var cityArray = ["4163971","2147714","2174003"] // 4163971,2147714,2174003
var citylist = "4163971,2147714,2174003"
let base_url = "http://api.openweathermap.org/data/2.5/"
let weather_listApi = "\(base_url)group?id=\(citylist)&units=\(units)&appid=\(app_id)"

