//
//  TimerManager.swift
//  WeatherApp
//
//  Created by Алексей Шамрей on 2.08.22.
//

import Foundation

class TimeManager {
    
    static var shared: TimeManager = {
        let instance = TimeManager()
        return instance
    }()
    
    private init() {}

    func solstice(unixtime: Double) -> String {
        let date = Date(timeIntervalSince1970: unixtime)
        let dateFormater = DateFormatter()
        dateFormater.timeZone = TimeZone(abbreviation: "GMT+3")
        dateFormater.locale = Locale.current
        dateFormater.dateFormat = "HH:mm"
        let formattedString = dateFormater.string(from: date)
        return formattedString
    }
    func curentDate(curentUnix: Double) -> String {
        let date = Date(timeIntervalSince1970: curentUnix)
        let dateFormater = DateFormatter()
        dateFormater.timeZone = TimeZone(abbreviation: "GMT+3")
        dateFormater.locale = Locale.current
        dateFormater.dateFormat = "EEEE, d MMM"
        let formattedString = dateFormater.string(from: date)
        return formattedString
    }
}
