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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func weatherDataConfigration(){
           cityNameLbl.text = cityModal?.name
       }
}
