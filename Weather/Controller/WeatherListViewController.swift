//
//  WeatherListViewController.swift
//  Weather
//
//  Created by V kishore kumar reddy  on 6/17/20.
//  Copyright © 2020 V kishore kumar reddy . All rights reserved.
//

import UIKit
protocol ControlAPICall {
    func weatherList()
}
class WeatherListViewController: UIViewController,ControlAPICall{
    var weatherViewModal = WeatherViewModal()
    var delegate:ControlAPICall!
    @IBOutlet weak var weatherListTableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherList()
        weatherListTableView.register(UINib(nibName: "WeatherListViewCell", bundle: nil), forCellReuseIdentifier: "WeatherListViewCell")
    }
    func weatherList() {
        weatherViewModal.vc = self
        weatherViewModal.getWeatherData()
    }
    // MARK: - Bar Buttun Action
    @IBAction func addBtnTapped(_ sender: UIBarButtonItem) {
        let cityListVc = self.storyboard?.instantiateViewController(identifier: "CityListViewController")as! CityListViewController
        cityListVc.delegate = self
        self.navigationController?.pushViewController(cityListVc, animated: true)
    }
    
}
// MARK: - UITableViewDelegate and UITableViewDataSource
extension WeatherListViewController :UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weatherViewModal.weatherArrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherListViewCell", for: indexPath) as? WeatherListViewCell
        let weatherModal = weatherViewModal.weatherArrayData[indexPath.row]
        cell?.weatherModal = weatherModal
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = self.storyboard?.instantiateViewController(identifier: "WeatherDetailViewController")as! WeatherDetailViewController
        self.navigationController?.pushViewController(detailVc, animated: true)
    }
}
