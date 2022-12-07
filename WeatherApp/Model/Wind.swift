//
//  Wind.swift
//  WeatherApp
//
//  Created by Алексей Шамрей on 8.08.22.
//

import Foundation

struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double?
}
