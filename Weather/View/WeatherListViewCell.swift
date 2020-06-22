//
//  WeatherListViewCell.swift
//  Weather
//
//  Created by V kishore kumar reddy  on 6/18/20.
//  Copyright © 2020 V kishore kumar reddy . All rights reserved.
//

import UIKit

class WeatherListViewCell: UITableViewCell {
    @IBOutlet weak var cityNameLbl: UILabel!
    @IBOutlet weak var cityTemperatureLbl: UILabel!
    var weatherModal: WeatherDataModal?{
        didSet{
            weatherDataConfigration()
        }
    }
    override func awakeFromNib(){
        super.awakeFromNib()
        // Initialization code
    }
    //MARK: Detail configure in listView
    func weatherDataConfigration(){
        cityNameLbl.text = weatherModal?.name
        cityTemperatureLbl.text = "\(String(describing: Int((weatherModal?.main!.temp)!) )) °C"
    }
}
