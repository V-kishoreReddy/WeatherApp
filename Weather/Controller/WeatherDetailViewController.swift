//
//  WeatherDetailViewController.swift
//  Weather
//
//  Created by V kishore kumar reddy  on 6/19/20.
//  Copyright © 2020 V kishore kumar reddy . All rights reserved.
//

import UIKit

class WeatherDetailViewController: UITableViewController {
    
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var maximumTemperatureLbl: UILabel!
    @IBOutlet weak var minimumTemperatureLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var pressureLbl: UILabel!
    var weatherModalData = WeatherDataModal()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = weatherModalData.name
        self.tableView.tableFooterView = UIView()
    }
    override func viewDidAppear(_ animated: Bool) {
        temperatureLbl.text =  "Temperature :- " + convertToCelsius(fahrenheit: Int(weatherModalData.main!.temp))
        maximumTemperatureLbl.text = "Max Temperature :- " + convertToCelsius(fahrenheit: Int(weatherModalData.main!.temp_max))
        minimumTemperatureLbl.text = "Min Temperature:- " + convertToCelsius(fahrenheit: Int(weatherModalData.main!.temp_min)) 
        humidityLbl.text = "Humidity :- " +   weatherModalData.main!.humidity + "rh"
        pressureLbl.text = " Pressure :- " + weatherModalData.main!.pressure + "hPa"
    }
    
}
