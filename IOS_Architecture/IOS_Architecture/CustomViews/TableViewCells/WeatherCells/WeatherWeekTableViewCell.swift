//
//  WeatherWeekTableViewCell.swift
//  IOS_Architecture
//
//  Created by Hassan dad khan on 24/09/2018.
//  Copyright © 2018 Hassan dad khan. All rights reserved.
//

import UIKit

protocol ExampleDelegate {
    func exampleButtonTapped(button : UIButton)
}
class WeatherWeekTableViewCell: UITableViewCell {

    var delegate : ExampleDelegate?
    @IBOutlet weak var btnExample: UIButton!
    @IBOutlet weak var lblFahrenheit: UILabel!
    @IBOutlet weak var lblWeekName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func exampleTapped(_ sender: UIButton) {
       delegate?.exampleButtonTapped(button: sender)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
