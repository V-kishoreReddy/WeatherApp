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
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherViewModal.vc1 = self
        weatherViewModal.readJSONFromLocalFile()
        cityListTableView.register(UINib(nibName: "CityListViewCell", bundle: nil), forCellReuseIdentifier: "CityListViewCell")
        // Do any additional setup after loading the view.
    }
}

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
          self.alert(message:"\(weatherViewModal.cityArrayData[indexPath.row].name) city already selected",title: "Status")  }else{
           appDelegate.cityArray.append(weatherViewModal.cityArrayData[indexPath.row].id)
        }
        self.delegate.weatherList()
        self.navigationController?.popViewController(animated: true)
        
    }
}
