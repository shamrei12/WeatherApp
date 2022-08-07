//
//  SessionManager.swift
//  WeatherApp
//
//  Created by Алексей Шамрей on 4.08.22.
//

import Foundation

class SessionManager {
    
    static var shared: SessionManager = {
        let instance = SessionManager()
        return instance
    }()
    
    private init() {}

    func weatherRequest(dataResponse: @escaping (WeatherModel) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(Coord.lat)&lon=\(Coord.lon)&appid=\(APIManager.API)"
        let baseURL = URL(string: urlString)
        //Инициализация сессии
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration)
        
        let dataTask = session.dataTask(with: baseURL!) { (data, response, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            let responseData =  self.parseJSON(data: data)
            DispatchQueue.main.async {
                dataResponse(responseData!)
            }
        }
        dataTask.resume()
    }
    
    func parseJSON(data: Data) -> WeatherModel? {
        do {
            let main = try JSONDecoder().decode(WeatherModel.self, from: data)
            return main
        } catch {
            print("Error")
            return nil
        }
    }
    
//    func responseFormation (main: Main, city: Name, currentDate: CurrentDate) -> (temperature: Int, appearentTemperature: Int, pressure: Int, humidity: Int, location: (String, String), sunrice: String, sunset: String, currentDate: String) {
//        let temperature = Int(main.main["temp"]?.rounded() as? Double ?? 0) - 273
//        let appearentTemperature = Int(main.main["feels_like"]?.rounded() as? Double ?? 0) - 273
//        let pressure = Int(main.main["pressure"]?.rounded() as? Double ?? 0)
//        let humidity = Int(main.main["humidity"]?.rounded() as? Double ?? 0)
//        let location = (main.sys.country as? String ?? "", city.name as? String ?? "")
//        let sunrice = TimeManager.shared.solstice(unixtime: Double(main.sys.sunset as? Int ?? 0))
//        let sunset =  TimeManager.shared.solstice(unixtime: Double(main.sys.sunrise as? Int ?? 0))
//        let currentDate = TimeManager.shared.curentDate(curentUnix: Double(currentDate.dt))
//        let resultSession = (temperature, appearentTemperature, pressure, humidity, location, sunrice, sunset, currentDate)
//        return resultSession
//    }
}

