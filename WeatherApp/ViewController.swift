//
//  ViewController.swift
//  WeatherApp
//
//  Created by Алексей Шамрей on 30.07.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var appearentTemperatureLabel: UILabel!
    
    @IBOutlet weak var refreshButton: UIButton!
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
        checkDate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkDate()
    }
//
    
    func checkDate() {
        let lat: String = "53,89952"
        let lon: String = "25,31274"
//        let prevURL = "https://api.openweathermap.org/data/2.5/weather?lat=53,89952&lon=25,31274&appid=e04e71ceaf8f07673c20c53098bf942c"
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=e04e71ceaf8f07673c20c53098bf942c"
        let baseURL = URL(string: urlString)
        //Инициализация сессии
        let sessionConfiguration = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfiguration)
        let request = URLRequest(url: baseURL!)
        
        let dataTask = session.dataTask(with: baseURL!) { (data, response, error) in
            guard let data = data else { return }
            guard error == nil else { return }
            DispatchQueue.main.async {
                do {
                    let name = try JSONDecoder().decode(Name.self, from: data)
                    let main = try JSONDecoder().decode(Main.self, from: data)
                    self.updateUIWith(Main: main, City: name)
                    
                } catch {
                    print("Error")
                }
            }
        }
        dataTask.resume()
    }
    
    func updateUIWith(Main: Main, City: Name) {
        let image = UIImage(named: "\(Main.weather[0].icon!)")
        self.temperatureLabel.text = String("\(Int(((Main.main["temp"]?.rounded())!) - 273)) ˚C")
        self.appearentTemperatureLabel.text = String("Feels like: \(Int(((Main.main["feels_like"]?.rounded())!) - 273)) ˚C")
        self.pressureLabel.text = String("\(Int(Main.main["pressure"]!)) mm")
        self.humidityLabel.text = String("\(Int(Main.main["humidity"]!)) %")
        self.locationLabel.text = String("\(Main.sys.country!),\(City.name)")
        self.imageView?.image = image
    }


}

