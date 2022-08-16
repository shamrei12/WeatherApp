//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Алексей Шамрей on 8.08.22.
//

import Foundation

struct WeatherModel: Codable {
    let coord: WeatherCoord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}
