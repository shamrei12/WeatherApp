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
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var appearentTemperatureLabel: UILabel!
    @IBOutlet weak var aboutWeather: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var currentDate: UILabel!
    @IBOutlet weak var sunrise: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var sunset: UILabel!
    @IBOutlet weak var sunriseImage: UIImageView!
    @IBOutlet weak var sunsetImage: UIImageView!
    @IBOutlet weak var pressureImge: UIImageView!
    let locationManager = CLLocationManager()
    var defaults = UserDefaults.standard
    var keyLatitude = "latitude"
    var keylongitude = "longitude"
    private var downloadIndicator: ActivityIndicatorView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        defaults.set("53,88993", forKey: keyLatitude)
        defaults.set("25,29817", forKey: keylongitude)
        updateUI()
    }
    
    //    func updateUI() {
    //        spinner.startAnimating()
    //        SessionManager.shared.weatherRequest { weatherModel in
    //            let imageName = "\(weatherModel.weather.first!.icon)"
    //            self.currentDate.text = TimeManager.shared.curentDate(curentUnix: Double(weatherModel.dt))
    //            self.temperatureLabel.text = String("\(Int(((weatherModel.main.temp.rounded())) - 273)) ˚C")
    //            self.appearentTemperatureLabel.text = String("Feels like \(Int(((weatherModel.main.feelsLike.rounded())) - 273)) ˚C")
    //            self.pressureLabel.text = String("\(Int((Double(weatherModel.main.pressure) * 100.0) / 133.3224)) mm")
    //            self.aboutWeather.text = "\(String(describing: weatherModel.weather.first?.main))"
    //            self.locationLabel.text = String("\(weatherModel.sys.country),\(weatherModel.name)")
    //            self.aboutWeather.text = String(weatherModel.weather.first?.weatherDescription ?? "")
    //            self.sunriseLabel.text = "\(TimeManager.shared.solstice(unixtime: Double(weatherModel.sys.sunrise)))"
    //            self.sunsetLabel.text = "\(TimeManager.shared.solstice(unixtime: Double(weatherModel.sys.sunset)))"
    //            self.naminglabel()
    //            self.imageAssignment(imageName)
    //            self.spinner.stopAnimating()
    //            self.spinner.hidesWhenStopped = true
    //        }
    //
    //    }

    func updateUI() {
        SessionManager.shared.weatherRequestCity(latitude: defaults.object(forKey: keyLatitude) as! String, longitude: defaults.object(forKey: keylongitude) as! String ) { weatherModel in
            let imageName = "\(weatherModel.weather.first!.icon)"
            self.currentDate.text = TimeManager.shared.curentDate(curentUnix: Double(weatherModel.dt))
            self.temperatureLabel.text = String("\(Int(((weatherModel.main.temp.rounded())) - 273)) ˚C")
            self.appearentTemperatureLabel.text = String("Feels like \(Int(((weatherModel.main.feelsLike.rounded())) - 273)) ˚C")
            self.pressureLabel.text = String("\(Int((Double(weatherModel.main.pressure) * 100.0) / 133.3224)) mm")
            self.aboutWeather.text = "\(String(describing: weatherModel.weather.first?.main))"
            self.locationLabel.text = String("\(weatherModel.sys.country),\(weatherModel.name)")
            self.aboutWeather.text = String(weatherModel.weather.first?.weatherDescription ?? "")
            self.sunriseLabel.text = "\(TimeManager.shared.solstice(unixtime: Double(weatherModel.sys.sunrise)))"
            self.sunsetLabel.text = "\(TimeManager.shared.solstice(unixtime: Double(weatherModel.sys.sunset)))"
            self.naminglabel()
            self.imageAssignment(imageName)
        }
        
    }
    
    func naminglabel() {
        self.sunrise.text = "Sunrise"
        self.sunset.text = "Sunset"
        self.pressure.text = "Pressure"
    }
    
    func imageAssignment(_ imageName: String) {
        let image = UIImage(named: imageName)
        self.imageView?.image = image
        self.sunriseImage?.image = UIImage(named: "sunrise")
        self.pressureImge?.image = UIImage(named: "barometer")
        self.sunsetImage?.image = UIImage(named: "sunset")
    }
}

