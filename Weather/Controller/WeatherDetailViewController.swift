//
//  WeatherDetailViewController.swift
//  Weather
//
//  Created by V kishore kumar reddy  on 6/19/20.
//  Copyright © 2020 V kishore kumar reddy . All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {
    
    var weatherModalData = WeatherDataModal()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = weatherModalData.name
        
    }
    
    //MARK: getWeatherDetail
    private func getWeatherDetail(index : Int)-> (title:String,value:String) {
        var title = ""
        var value = ""
        switch index {
        case 0:
            title = "Temperature"
            value = "\(String(describing: Int(weatherModalData.main!.temp)))°C"
        case 1:
            title = "Temp_max"
            value = "\(String(describing: Int((weatherModalData.main?.temp_max)!))) °C"
            
        case 2:
            title = "Temp_min"
            value = "\(String(describing: Int((weatherModalData.main?.temp_min)!))) °C"
        case 3:
            title = "Humidity"
            value = weatherModalData.main!.humidity + "%"
        case 4:
            title = "Pressure"
            value = weatherModalData.main!.humidity + "mb"
        case 5:
            title = "Sunrise"
            value =  getTimeStringFromDate(dateValue: (weatherModalData.sys?.sunrise)!, timezone: (weatherModalData.sys?.timezone)!)
        case 6:
            title = "Sunset"
            value = getTimeStringFromDate(dateValue: (weatherModalData.sys?.sunset)!, timezone: (weatherModalData.sys?.timezone)!)
        default:
            title = "Pressure"
            value = weatherModalData.main!.humidity + "mb"
        }
        return (title,value)
    }
}
// MARK: - Delegate and DataSource Methods
extension WeatherDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"WeatherDetailCollectionViewCell", for: indexPath) as! WeatherDetailCollectionViewCell
        let weatherDetail = self.getWeatherDetail(index: indexPath.row)
        cell.titleLbl.text = weatherDetail.title
        cell.detailLbl.text = weatherDetail.value
        return cell
    }
   
}

