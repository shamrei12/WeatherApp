//
//  SessionManager.swift
//  WeatherApp
//
//  Created by Алексей Шамрей on 4.08.22.
//

import Foundation
import CoreLocation


class SessionManager {
    static var shared: SessionManager = {
        let instance = SessionManager()
        return instance
    }()
    
    private init() {}
    
    func weatherRequest(dataResponse: @escaping (WeatherModel) -> Void) {
        LocationManager.shared.getCurrentLocation { (location) in
            let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=\(APIManager.API)"
            print(urlString)
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
    
}

