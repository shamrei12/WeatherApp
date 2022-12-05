//
//  CityTableViewCell.swift
//  WeatherApp
//
//  Created by Алексей Шамрей on 4.12.22.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
