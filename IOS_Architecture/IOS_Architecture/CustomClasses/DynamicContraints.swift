//
//  DynamicContraints.swift
//  IOS_Architecture
//
//  Created by Hassan dad khan on 05/09/2019.
//  Copyright © 2019 Hassan dad khan. All rights reserved.
//

import Foundation
import UIKit

class DynamicVerticalConstraint : NSLayoutConstraint {
    
    override init() {
        super.init()
        setup()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    func setup() {
        self.constant = self.constant * (UIScreen.main.bounds.height/667)
    }
    
}
class DynamicHorizontalConstraint: NSLayoutConstraint {
    
    override init() {
        super.init()
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    func setup() {
        self.constant = self.constant * (UIScreen.main.bounds.width/375)
    }
    
}
