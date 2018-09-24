//
//  UIButtonExtension.swift
//  IOS_Architecture
//
//  Created by Hassan dad khan on 24/09/2018.
//  Copyright © 2018 Hassan dad khan. All rights reserved.
//

import UIKit
import Foundation

private struct AssociatedKeys {
    static var section = "section"
    static var row = "row"
}

extension UIButton {
    var section : Int {
        get {
            guard let number = objc_getAssociatedObject(self,   &AssociatedKeys.section) as? Int else {
                return -1
            }
            return number
        }
        
        set(value) {
            objc_setAssociatedObject(self,&AssociatedKeys.section,Int(value),objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    var row : Int {
        get {
            guard let number = objc_getAssociatedObject(self, &AssociatedKeys.row) as? Int else {
                return -1
            }
            return number
        }
        
        set(value) {
            objc_setAssociatedObject(self,&AssociatedKeys.row,Int(value),objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
