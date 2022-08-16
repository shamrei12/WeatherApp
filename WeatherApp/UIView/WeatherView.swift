//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Алексей Шамрей on 3.08.22.
//


import UIKit
import CoreLocation

class WeatherView: UIView, CLLocationManagerDelegate {
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var appearentTemperatureLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var currentDate: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    let locationManager = CLLocationManager()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateUI()
    }
    
    func updateUI() {
        
        SessionManager.shared.weatherRequest { weatherModel in

            self.currentDate.text = TimeManager.shared.curentDate(curentUnix: Double(weatherModel.dt))
            let image = UIImage(named: "\(weatherModel.weather.first!.icon)")
            self.temperatureLabel.text = String("\(Int(((weatherModel.main.temp.rounded())) - 273)) ˚C")
            self.appearentTemperatureLabel.text = String("Feels like: \(Int(((weatherModel.main.feelsLike.rounded())) - 273)) ˚C")
            self.pressureLabel.text = String("\(Int(weatherModel.main.pressure)) mm")
            self.humidityLabel.text = String("\(Int(weatherModel.main.humidity)) %")
            self.locationLabel.text = String("\(weatherModel.sys.country),\(weatherModel.name)")
            self.imageView?.image = image
            self.sunriseLabel.text = "Sunrise: \(TimeManager.shared.solstice(unixtime: Double(weatherModel.sys.sunrise)))"
            self.sunsetLabel.text = "Sunset: \(TimeManager.shared.solstice(unixtime: Double(weatherModel.sys.sunset)))"
        }
    }
}
