//
//  WeatherViewModal.swift
//  Weather
//
//  Created by V kishore kumar reddy  on 6/18/20.
//  Copyright © 2020 V kishore kumar reddy . All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class WeatherViewModal{
    weak var vc : WeatherListViewController?
    weak var cityListVc : CityListViewController?
    var weatherArrayData = [WeatherDataModal]()
    var cityArrayData = [WeatherCityModal]()
    
     // MARK:- Web Service API
    /*=======================================================================
       Call API to import Weather Detail
       =======================================================================*/
    func getWeatherData(){
        let appDelegate : AppDelegate = AppDelegate().sharedInstance()
       let citylist = appDelegate.cityArray.joined(separator:",")
        let weather_listApi = "\(base_url)group?id=\(citylist)&units=\(units)&appid=\(app_id)"
        URLSession.shared.dataTask(with: URL(string:weather_listApi)!) {data,response,error in
            guard let data = data else {return}
            do{
                let json = try JSON(data: data)
                let result  = json["list"]
                self.weatherArrayData.removeAll()
                for arr in result.arrayValue{
                    self.weatherArrayData.append(WeatherDataModal(json: arr))
                }
                DispatchQueue.main.async {
                    self.vc?.weatherListTableView.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    // MARK:- Local JSON
    /*=======================================================================
     Call local Json responce to import City List
     =======================================================================*/
    func readJSONFromLocalFile() {
        if let path = Bundle.main.path(forResource: "current.city.list", ofType: "json")
        {
            if let jsonData = NSData(contentsOfFile: path)
            {
                do {
                    let result = try JSON(data: jsonData as Data)
                    for arr in result.arrayValue{
                        self.cityArrayData.append(WeatherCityModal(cityJosn: arr))
                    }
                    print(cityArrayData.count)
                    DispatchQueue.main.async {
                        self.cityListVc?.cityListTableView.reloadData()
                    }
                }
                catch let exception {
                    exception.localizedDescription
                }
            }
        }
    }
}
