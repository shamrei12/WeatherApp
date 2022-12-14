//
//  ContainerViewController.swift
//  WeatherApp
//
//  Created by Алексей Шамрей on 3.12.22.
//

import UIKit

class ContainerViewController: UIViewController, WeatherViewControllerDelegate {
    var controller: UIViewController!
    var menuViewController: UIViewController!
    var isMove = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureWeatherViewController()
    }
    
    func configureWeatherViewController() {
        let weatherController = WeatherViewController.instantiate()
        weatherController.delegate = self
        controller = weatherController
        view.addSubview(controller.view)
        addChild(controller)
    }
    
    func configureMenuViewController() {
        if menuViewController == nil {
            menuViewController = MenuViewController.instantiate()
            view.insertSubview(menuViewController.view, at: 0)
            addChild(menuViewController)
            if let weatherView = view as? WeatherView {
                print("Menu")
                weatherView.updateUI()
            }
        }
    }
    
    func showWeatherViewController(shouldMove: Bool ) {
        if shouldMove {
            // show
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {
                self.controller.view.frame.origin.x = self.controller.view.frame.width - 140
            })
        } else {
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .curveEaseInOut,
                           animations: {
                self.controller.view.frame.origin.x = 0
            })
        }
    }
    
    //MARK: Menu
    func toogleMenu() {
        configureMenuViewController()
        isMove = !isMove
        showWeatherViewController(shouldMove: isMove)
    }
}
