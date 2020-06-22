//
//  CityListViewCell.swift
//  Weather
//
//  Created by V kishore kumar reddy  on 6/19/20.
//  Copyright © 2020 V kishore kumar reddy . All rights reserved.
//

import UIKit

class CityListViewCell: UITableViewCell {
@IBOutlet weak var cityNameLbl: UILabel!
    var cityModal: WeatherCityModal?{
        didSet{
            weatherDataConfigration()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    // MARK: City List Configure in list
    func weatherDataConfigration(){
           cityNameLbl.text = cityModal?.name
       }
}
