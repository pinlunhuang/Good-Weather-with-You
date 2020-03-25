//
//  WeatherData.swift
//  Good Weather with You
//
//  Created by Pinlun on 2020/3/25.
//  Copyright © 2020 Pinlun. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
    let id: Int
}
