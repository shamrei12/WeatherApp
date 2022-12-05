//
//  MenuBarViewController.swift
//  WeatherApp
//
//  Created by Алексей Шамрей on 2.12.22.
//

import UIKit

extension MenuViewController: UITableViewDelegate {
    
}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return city.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: CityTableViewCell
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: "CityTableViewCell") as? CityTableViewCell {
            cell = reuseCell
        } else {
            cell = CityTableViewCell()
        }
        return configure(cell: cell, for: indexPath)
    }
    
    
    private func configure(cell: CityTableViewCell, for indexPath: IndexPath) -> UITableViewCell {

        cell.cityName?.text = city[indexPath.row]
        print(city[indexPath.row])
        return cell
    }
}



class MenuViewController: UIViewController {
    var cell: CityTableViewCell!
    @IBOutlet weak var tableView: UITableView!
    var city: [String] = ["Текущая геопозиция", "Lida", "Minsk"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        tableView.register(UINib(nibName: "CityTableViewCell", bundle: nil), forCellReuseIdentifier: "CityTableViewCell")
    }

}
