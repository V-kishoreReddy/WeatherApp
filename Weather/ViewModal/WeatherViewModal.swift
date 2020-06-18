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
    var weatherArrayData = [WeatherDataModal]()
    func getALLUserData(){
        URLSession.shared.dataTask(with: URL(string:weather_listApi)!) {data,response,error in
            guard let data = data else {return}
            do{
                let json = try JSON(data: data)
                let result  = json["list"]
                for arr in result.arrayValue{
                    self.weatherArrayData.append(WeatherDataModal(json: arr))
                }
                print(self.weatherArrayData)
                DispatchQueue.main.async {
                    self.vc?.weatherListTableView.reloadData()
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}
