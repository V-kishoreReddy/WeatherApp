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
    @IBOutlet weak var addCityBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherList()
        weatherListTableView.register(UINib(nibName: "WeatherListViewCell", bundle: nil), forCellReuseIdentifier: "WeatherListViewCell")
        self.weatherListTableView.tableFooterView = UIView()
        addCityBtn.accessibilityIdentifier = addNewCityBtn
        weatherListTableView.accessibilityIdentifier = weatherListTableVc
        //Timer for Update periodically Api
        Timer.scheduledTimer(withTimeInterval: 20, repeats: true) {
            (_) in
            self.weatherList()
        }
    }
    func weatherList() {
        weatherViewModal.vc = self
        weatherViewModal.getWeatherData()
    }
    // MARK: - Bar Buttun Action
    @IBAction func addBtnTapped(_ sender: UIBarButtonItem) {
        let cityListVc = self.storyboard?.instantiateViewController(identifier: "CityListViewController")as! CityListViewController
        cityListVc.delegate = self
        let progressHUD = ProgressHUD(text: "Please Wait")
        progressHUD.show()
        self.navigationController?.pushViewController(cityListVc, animated: true)
    }
    
}
// MARK: - Extension for UITableViewDelegate and UITableViewDataSource
extension WeatherListViewController :UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weatherViewModal.weatherArrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherListViewCell", for: indexPath) as? WeatherListViewCell
        cell!.accessibilityIdentifier = "myCell_\(indexPath.row)"
        let weatherModal = weatherViewModal.weatherArrayData[indexPath.row]
        cell?.weatherModal = weatherModal
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = self.storyboard?.instantiateViewController(identifier: "WeatherDetailViewController")as! WeatherDetailViewController
        detailVc.weatherModalData = weatherViewModal.weatherArrayData[indexPath.row]
        self.navigationController?.pushViewController(detailVc, animated: true)
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -200, 0, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0.5
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1)
        UIView.animate(withDuration: 0.3, animations: {
            cell.layer.transform = CATransform3DMakeScale(1.05, 1.05, 1)
        },completion: { finished in
            UIView.animate(withDuration: 0.1, animations: {
                cell.layer.transform = CATransform3DMakeScale(1, 1, 1)
            })
        })
        UIView.animate(withDuration: 0.5){
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
