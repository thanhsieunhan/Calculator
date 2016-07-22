//
//  NumberButton.swift
//  Calculator
//
//  Created by le ha thanh on 7/14/16.
//  Copyright © 2016 le ha thanh. All rights reserved.
//

import UIKit

class NumberButton: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        numberButton()
    }
    
    func numberButton() -> Void {
        backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        // Shadow and Radius
        layer.shadowColor = UIColor(red: 255/355, green: 255/255, blue: 255/255, alpha: 0.25).CGColor
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 0.0
        layer.masksToBounds = false
        layer.cornerRadius = 4.0
    }
    
    
}
