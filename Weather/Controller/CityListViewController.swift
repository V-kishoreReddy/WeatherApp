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
    @IBOutlet weak var searchBar: UISearchBar!
    var delegate:ControlAPICall!
    var weatherViewModal = WeatherViewModal()
    let progressHUD = ProgressHUD(text: "Please Wait")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(progressHUD)
        navigationItem.title = "Current City List"
        searchBar.text = " "
        cityListTableView.register(UINib(nibName: "CityListViewCell", bundle: nil), forCellReuseIdentifier: "CityListViewCell")
        weatherViewModal.cityListVc = self
        weatherViewModal.readJSONFromLocalFile()
        //Set color to uisearch bar
        let textFieldSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldSearchBar?.backgroundColor = UIColor.lightGray
        textFieldSearchBar?.textColor = UIColor.white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        progressHUD.hide()
    }
    //Key Board Dismiss 
    func dismissKeyboard() {
        DispatchQueue.main.async {
            self.searchBar.resignFirstResponder()
        }
    }
}

// MARK: - Extension for UITableViewDelegate and UITableViewDataSource
extension CityListViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weatherViewModal.filterCityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityListViewCell", for: indexPath) as? CityListViewCell
        let cityModal = weatherViewModal.filterCityArray[indexPath.row]
        cell!.cityModal = cityModal
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let appDelegate : AppDelegate = AppDelegate().sharedInstance()
        if appDelegate.cityArray.contains(weatherViewModal.filterCityArray[indexPath.row].id){
            self.alert(message:"\(weatherViewModal.filterCityArray[indexPath.row].name) \(alertMsg)",title: "Status")  }else{
            appDelegate.cityArray.append(weatherViewModal.filterCityArray[indexPath.row].id)
        }
        self.delegate.weatherList()
        self.navigationController?.popViewController(animated: true)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
//MARK: - UISearchBar Delegate
extension CityListViewController: UISearchBarDelegate {
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyboard()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        weatherViewModal.searchEmployee(with: searchText) {
            self.cityListTableView.reloadData()
            if searchText.isEmpty {
                self.dismissKeyboard()
            }
        }
    }
}
