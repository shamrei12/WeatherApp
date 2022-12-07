//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Egor Laba on 7.08.22.
//

import UIKit


protocol WeatherViewControllerDelegate {
     func toogleMenu()
}

class WeatherViewController: UIViewController {
    var delegate: WeatherViewControllerDelegate?
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var refreshButton: UIButton!
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    
    @IBAction func refreshTapped(_ sender: UIButton) {
        if let weatherView = view as? WeatherView {
            weatherView.updateUI()
        }

    }
    
    @IBAction func menuTapped(_ sender: UIButton) {
        if let weatherView = view as? WeatherView {
            weatherView.updateUI()
        }
        delegate?.toogleMenu()
    }
    
    
}
