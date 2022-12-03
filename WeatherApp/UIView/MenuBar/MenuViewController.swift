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
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = city[indexPath.row]
        cell.contentConfiguration = configuration
        // возвращаем сконфигурированный экземпляр ячейки
        return cell
    }
}



class MenuViewController: UIViewController {
    let city: [String] = ["lida", "Minsk", "Vitebsk", "Brest", "Gomel", "Mogilev"]
    override func viewDidLoad() {
        super.viewDidLoad()

    }



}
