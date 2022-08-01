//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Алексей Шамрей on 1.08.22.
//

import Foundation

struct Main: Decodable {
    let main: [String: Double]
    let weather: [Weather]
    let sys: Sys
}

struct Name: Decodable {
    var name: String
}

//struct Sys: Decodable {
//    let type: Int
//    let id: Int
//    let message: Double
//    let country: String
//    let sunrise: UInt
//    let sunset: UInt
//}

struct Weather : Decodable {
    var id : Int?
    var main, myDescription, icon : String?

    enum CodingKeys : String, CodingKey {
        case id = "id"
        case main = "main"
        case icon = "icon"
        case myDescription = "description"
    }
}

struct Sys: Decodable {
    var type, id, sunrise, sunset: Int?
    var message: Double?
    var country: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case sunrise = "sunrise"
        case sunset = "sunset"
        case message = "message"
        case country = "country"
        
    }
    
}

