//
//  ViewController.swift
//  Good Weather with You
//
//  Created by Pinlun on 2020/3/24.
//  Copyright © 2020 Pinlun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var cithLbl: UILabel!
    
    @IBOutlet weak var searchField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchField.delegate = self
        weatherManager.delegate = self
    }

    @IBAction func searchPressed(_ sender: Any) {
        searchField.endEditing(true)
        print(searchField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchField.endEditing(true)
        print(searchField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type Something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchField.text {
            weatherManager.getWeather(city: city)
        }
        searchField.text = ""
    }
    
    func didUpdateWeather(weather: WeatherModel) {
        print(weather.temp)
    }
}

