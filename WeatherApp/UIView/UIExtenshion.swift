//
//  UIExtenshion.swift
//  WeatherApp
//
//  Created by Алексей Шамрей on 7.08.22.
//

import Foundation
import UIKit

extension UIViewController {
    static func instantiate() -> Self {
        let nibName = String(describing: self)
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil)[0] as! Self
    }
}
