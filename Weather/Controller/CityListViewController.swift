//
//  CityListViewController.swift
//  Weather
//
//  Created by V kishore kumar reddy  on 6/18/20.
//  Copyright © 2020 V kishore kumar reddy . All rights reserved.
//

import UIKit

class CityListViewController: UIViewController{
    
    @IBOutlet weak var cityListTableView: UITableView!
    var delegate:ControlAPICall!
    var weatherViewModal = WeatherViewModal()
    let progressHUD = ProgressHUD(text: "Please Wait")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(progressHUD)
        navigationItem.title = "Current City List"
        cityListTableView.register(UINib(nibName: "CityListViewCell", bundle: nil), forCellReuseIdentifier: "CityListViewCell")
        weatherViewModal.cityListVc = self
        weatherViewModal.readJSONFromLocalFile()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        progressHUD.hide()
    }
}

// MARK: - Extension for UITableViewDelegate and UITableViewDataSource
extension CityListViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weatherViewModal.cityArrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityListViewCell", for: indexPath) as? CityListViewCell
        let cityModal = weatherViewModal.cityArrayData[indexPath.row]
        cell!.cityModal = cityModal
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let appDelegate : AppDelegate = AppDelegate().sharedInstance()
        if appDelegate.cityArray.contains(weatherViewModal.cityArrayData[indexPath.row].id){
            self.alert(message:"\(weatherViewModal.cityArrayData[indexPath.row].name) \(alertMsg)",title: "Status")  }else{
            appDelegate.cityArray.append(weatherViewModal.cityArrayData[indexPath.row].id)
        }
        self.delegate.weatherList()
        self.navigationController?.popViewController(animated: true)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
