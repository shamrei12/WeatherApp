//
//  MenuBarViewController.swift
//  WeatherApp
//
//  Created by Алексей Шамрей on 2.12.22.
//

import UIKit


extension MenuViewController: UICollectionViewDelegate {

}

extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        city.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell: CityCollectionViewCell
        if let reuseCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCollectionViewCell", for: indexPath) as? CityCollectionViewCell {
            cell = reuseCell
        } else {
            cell = CityCollectionViewCell()
        }
        return configure(cell: cell, for: indexPath)
    }
    
    private func configure(cell: CityCollectionViewCell, for indexPath: IndexPath) -> UICollectionViewCell {
        cell.cityName.text = city[indexPath.row].uppercased()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let (latitude, longitude) = getCoord(city[indexPath.row].lowercased())
        defaults.set(latitude, forKey: keyLatitude)
        defaults.set(longitude, forKey: keylongitude)
        if let weatherView = view as? WeatherView {
            weatherView.updateUI()
        }
    }
    
    
    func getCoord(_ city: String) -> (String, String) {
        switch city {
        case "minsk":
            return ("53,89620", "27,55031")
        case "lida":
            return ("53,88993", "25,29817")
        case "vitebsk":
            return ("55,17954", "30,21066")
        case "homel":
            return ("52,43033", "31,00636")
        case "mogilev":
            return ("53,87782", "30,33824")
        case "hrodno":
            return ("53,68321", "23,83515")
        case "brest":
            return ("52,08777", "23,70254")
        default:
            return ("53,88993", "25,29817")
        }
    }
}



class MenuViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var cell: CityCollectionViewCell!
    var city: [String] = ["Lida", "Minsk", "Hrodno", "Vitebsk", "Mogilev", "Homel", "Brest"]
    var defaults = UserDefaults.standard
    var keyLatitude = "latitude"
    var keylongitude = "longitude"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cell?.layer.backgroundColor = UIColor.clear.cgColor
        collectionView.layer.backgroundColor = UIColor.clear.cgColor
        collectionView.register(UINib(nibName: "CityCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CityCollectionViewCell")

    }

}
