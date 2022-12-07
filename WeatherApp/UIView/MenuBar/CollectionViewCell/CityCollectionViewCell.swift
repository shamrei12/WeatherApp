//
//  CityCollectionViewCell.swift
//  WeatherApp
//
//  Created by Алексей Шамрей on 5.12.22.
//

import UIKit

//extension UIView {
//    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
//        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        self.layer.mask = mask
//    }
//}


class CityCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cityName: UILabel!
    
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.backgroundColor = UIColor.white.cgColor
//        mainView.layer.cornerRadius = 90
        // Initialization code
    }
    
}
