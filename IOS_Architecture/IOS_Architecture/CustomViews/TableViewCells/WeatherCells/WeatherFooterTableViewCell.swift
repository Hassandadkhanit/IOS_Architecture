//
//  WeatherFooterTableViewCell.swift
//  IOS_Architecture
//
//  Created by Hassan dad khan on 24/09/2018.
//  Copyright © 2018 Hassan dad khan. All rights reserved.
//

import UIKit

protocol weatherFooterDelegate {
    func refreshButtonTapped(button : UIButton)
}

class WeatherFooterTableViewCell: UITableViewCell {

    var delegate : weatherFooterDelegate?
    @IBOutlet weak var btnRefresh: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func resfreshTapped(_ sender: UIButton) {
        
        delegate?.refreshButtonTapped(button: sender)
    }
    
}
