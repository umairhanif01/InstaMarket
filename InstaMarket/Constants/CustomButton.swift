//
//  CustomButton.swift
//  InstaMarket
//
//  Created by Umair Hanif on 22/10/2020.
//

import Foundation
import UIKit

@IBDesignable

class CustomButton: UIButton {
    
    @IBInspectable var BorderWidth : CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = BorderWidth
        }
    }
    
    @IBInspectable var BorderColor : UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = BorderColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var shadow : Bool = false {
        didSet {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOpacity = 0.3
            self.layer.shadowOffset = CGSize(width: 0, height: 4)
            self.layer.shadowRadius = 4
        }
    }
    
}
