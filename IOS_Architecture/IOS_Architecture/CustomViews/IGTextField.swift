//
//  IGTextField.swift
//  IOS_Architecture
//
//  Created by Hassan dad khan on 21/03/2020.
//  Copyright © 2020 Hassan dad khan. All rights reserved.
//

import Foundation
import UIKit

class IGTextField : UIView {
    
    @IBOutlet weak var imgRight: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imgLeft: UIImageView!
    @IBOutlet weak var lblErrorMessage: UILabel!
    @IBOutlet weak var backgroundView: UIView!
    
    var view : UIView!
    
    //MARK: - InitView
    public override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetUp()
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetUp()
    }
    
    func xibSetUp() {
        
        view = loadViewFromNib()
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = true
        addSubview(view)
        
        viewEssentails()
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return nibView
    }
    
    func viewEssentails() {
        // setup view
    }
    
    @IBInspectable var rightImage : UIImage? {
        get {
            return self.rightImage
        }
        set {
            if let image = newValue {
                self.imgRight.image = image
            }
        }
    }
    
    @IBInspectable var leftImage : UIImage? {
        get {
            return self.leftImage
        }
        set {
            if let image = newValue {
                self.imgLeft.image = image
            }
        }
    }
    @IBInspectable var placeHolderColor : UIColor? {
        get{
           return self.placeHolderColor
        }
        set {
            if let color = newValue {
                textField.attributedPlaceholder = NSAttributedString(string: textField.text ?? "",
                attributes: [NSAttributedString.Key.foregroundColor: color])
            }
            
            
        }
    }
    
}
