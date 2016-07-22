//
//  GrandientView.swift
//  Calculator
//
//  Created by le ha thanh on 7/12/16.
//  Copyright © 2016 le ha thanh. All rights reserved.
//

import UIKit

class GrandientView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if tag == 110 {
            backgroundColor = UIColor.init(red: 49/255, green: 58/255, blue: 75/255, alpha: 1.0)
        } else {
            createGrandient()
        }
    }
    
    func createGrandient(){
        let bgGragdient = CAGradientLayer()
        bgGragdient.frame = self.frame
        
        bgGragdient.colors =  [ UIColor.init(red: 57/255, green: 120/255, blue: 127/255, alpha: 1.0).CGColor,
                                UIColor.init(red: 77/255, green: 188/255, blue: 201/255, alpha: 1.0).CGColor ]
        
        let startPoint = CGPoint.init(x: 0, y: 0)
        let endPoint =  CGPoint.init(x: 0.5, y: 0.8)
        
        bgGragdient.startPoint = startPoint
        bgGragdient.endPoint = endPoint
        
        self.layer.insertSublayer(bgGragdient,  atIndex: 0)
    }
}
