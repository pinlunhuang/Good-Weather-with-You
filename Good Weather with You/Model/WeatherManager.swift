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
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let responseData = data {
                    self.parseJsonData(weatherData: responseData)
                }
            }
            task.resume()
        }
    }
    
    func parseJsonData(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temp: temp)
            print(weather.temp)
        } catch {
            print(error)
        }
    }
}
