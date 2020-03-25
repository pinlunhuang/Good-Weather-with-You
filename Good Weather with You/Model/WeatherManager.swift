//
//  WeatherManager.swift
//  Good Weather with You
//
//  Created by Pinlun on 2020/3/25.
//  Copyright © 2020 Pinlun. All rights reserved.
//

import Foundation

struct WeatherManager {
    let apiURL = "https://api.openweathermap.org/data/2.5/weather?appid=f4d58e5ec39cb74e6c0c582fbd7fa2ea&units=metric"
    
    func getWeather(city: String) {
        let url = "\(apiURL)&q=\(city)"
        sendRequest(urlString: url)
    }
    
    func sendRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url, completionHandler: processResponse(data:response:error:))
            
            task.resume()
        }
    }
    
    func processResponse(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let responseData = data {
            let dataString = String(data: responseData, encoding: .utf8)
            print(dataString)
        }
    }
}
