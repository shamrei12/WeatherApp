//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by Egor Laba on 7.08.22.
//

import UIKit


class WeatherViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func refreshButtonTapped(_ sender: Any){
        if let weatherView = view as? WeatherView {
            weatherView.updateUI()
        }
    }
}
