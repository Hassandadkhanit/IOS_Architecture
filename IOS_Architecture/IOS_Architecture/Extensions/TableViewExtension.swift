//
//  TableViewExtension.swift
//  IOS_Architecture
//
//  Created by Hassan dad khan on 24/09/2018.
//  Copyright © 2018 Hassan dad khan. All rights reserved.
//

import UIKit

extension UITableView {
    func registerCellWithName(name : String)  {
        
        let cell = UINib(nibName: name, bundle: nil)
        self.register(cell, forCellReuseIdentifier: name)
    }
}
