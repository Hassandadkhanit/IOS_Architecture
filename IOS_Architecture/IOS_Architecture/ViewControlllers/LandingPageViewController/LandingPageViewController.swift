//
//  LandingPageViewController.swift
//  IOS_Architecture
//
//  Created by Hassan dad khan on 05/09/2019.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//

import UIKit

class LandingPageViewController: BaseViewController {

    @IBOutlet weak var btnProfileView: UIButton!
    @IBOutlet weak var usernameTextField: IGTextField!
    @IBOutlet weak var logoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func profileViewTapped(_ sender: UIButton) {
        
        let parameters: [String: Any] = [
            "username": usernameTextField.textField.text ?? ""
        ]
        
        APIClient.shared.getProfile(parameters: parameters) { (response, result, error) in
            
        }
    }
    

}
