//
//  UIImageViewExtension.swift
//  IOS_Architecture
//
//  Created by Hassan dad khan on 06/12/2020.
//  Copyright © 2020 Hassan dad khan. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage



extension UIImageView {
    
    func setImage(withUrl url : String, withPlaceHolder placeholder : String)  {
        
        self.sd_setImage(
            with: URL.init(string: url),
            placeholderImage: placeholder.isBlank ? UIImage() : UIImage(named: placeholder),
            options: .allowInvalidSSLCertificates,
            completed: nil
        )
    }
    func setImageGif(withUrl url : String, withPlaceHolder placeholder : String)  {
        self.sd_setImage(
            with: URL.init(string: url),
            placeholderImage: placeholder.isBlank ? UIImage() : UIImage(named: placeholder),
            options: .progressiveLoad,
            completed: nil
        )
    }
 
}
