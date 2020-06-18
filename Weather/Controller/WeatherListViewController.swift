//
//  WeatherListViewController.swift
//  Weather
//
//  Created by V kishore kumar reddy  on 6/17/20.
//  Copyright © 2020 V kishore kumar reddy . All rights reserved.
//

import UIKit

class WeatherListViewController: UIViewController {
    
    var weatherViewModal = WeatherViewModal()
    @IBOutlet weak var weatherListTableView : UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherViewModal.vc = self
        weatherViewModal.getALLUserData()
        weatherListTableView.dataSource  = self
        weatherListTableView.register(UINib(nibName: "WeatherListViewCell", bundle: nil), forCellReuseIdentifier: "WeatherListViewCell")
    }
    
    // MARK: - Bar Buttun Action
    @IBAction func addBtnTapped(_ sender: UIBarButtonItem) {
        let cityListVc = self.storyboard?.instantiateViewController(identifier: "CityListViewController")as! CityListViewController
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
        // tableVc.modalData = arrData[indexPath.row]
        self.navigationController?.pushViewController(detailVc, animated: true)
    }
}
