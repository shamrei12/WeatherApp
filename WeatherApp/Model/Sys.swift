//
//  Sys.swift
//  WeatherApp
//
//  Created by Алексей Шамрей on 8.08.22.
//

import Foundation

struct Sys: Codable {
    let country: String
    let sunrise, sunset: Int
}
