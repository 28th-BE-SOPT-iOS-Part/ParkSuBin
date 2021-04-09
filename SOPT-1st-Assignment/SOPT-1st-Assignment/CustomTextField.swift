//
//  CustomTextField.swift
//  SOPT-1st-Assignment
//
//  Created by Subeen Park on 2021/04/09.
//

import UIKit

extension UITextField {
    
    func underlined(){
            let border = CALayer()
            let width = CGFloat(1.0)
            border.borderColor = UIColor.black.cgColor
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
            border.borderWidth = width
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
        }

}
