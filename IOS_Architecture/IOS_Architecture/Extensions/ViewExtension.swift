//
//  ViewExtension.swift
//  IOS_Architecture
//
//  Created by Hassan dad khan on 06/12/2020.
//  Copyright © 2020 Hassan dad khan. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var Corner_Radious : CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.clipsToBounds = true
            self.layer.cornerRadius = newValue
        }
    }
    @IBInspectable var Border_Width : CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    @IBInspectable var Border_Color : UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
}
