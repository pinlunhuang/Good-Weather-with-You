//
//  WeatherManager.swift
//  Good Weather with You
//
//  Created by Pinlun on 2020/3/25.
//  Copyright © 2020 Pinlun. All rights reserved.
//

import Foundation

struct WeatherManager {
    let apiURL = "http://api.openweathermap.org/data/2.5/weather?appid=f4d58e5ec39cb74e6c0c582fbd7fa2ea&units=metric"
    
    func getWeather(city: String) {
        let urlString = "\(apiURL)&q=\(city)"
        print(urlString)
    }
}
