//
//  Extension.swift
//  Weather
//
//  Created by V kishore kumar reddy  on 6/19/20.
//  Copyright © 2020 V kishore kumar reddy . All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    func convertToCelsius(fahrenheit: Int) -> String {
        let roudedStr = " " + String(format: "%.2f",Double(5.0 / 9.0 * (Double(fahrenheit) - 32.0))) + "°C"
        return roudedStr
    }
    // get date from stringd
    func getTimeStringFromDate(dateValue:Int, timezone:Int) -> String {
        let date = NSDate(timeIntervalSince1970: TimeInterval(dateValue))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.timeZone = TimeZone(secondsFromGMT:timezone)
        let dataString = dateFormatter.string(from: date as Date)
        return dataString
    }
    
}
extension UITableViewCell{
    func convertToCelsius(fahrenheit: Int) -> String {
        let roudedStr = String(format: "%.2f",Double(5.0 / 9.0 * (Double(fahrenheit) - 32.0))) + "°C"
        return roudedStr
    }
}
