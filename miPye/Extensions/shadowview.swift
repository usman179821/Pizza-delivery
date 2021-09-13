//
//  shadowview.swift
//  RideShare
//
//  Created by Muhammad Usman on 02/06/1441 AH.
//  Copyright © 1441 Macbook. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
    func shadow() {
     self.layer.shadowOpacity = 1
      self.layer.shadowRadius = 1
      self.layer.cornerRadius = 6
      layer.shadowOffset = CGSize(width: 0.1, height: 0.3)
      self.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        //self.layer.borderWidth = 0
    }
    func RoundSpecific() {
        self.layer.shadowOpacity = 1
         self.layer.shadowRadius = 1
         self.layer.cornerRadius = 25
        layer.shadowOffset = CGSize(width: 1, height: 2)
         self.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
       // self.layer.clipsToBounds = true
        
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
      
           //self.layer.borderWidth = 0

       }
    func RoundSpecificBottom () {
      
       self.layer.cornerRadius = 30
        
      
     // self.layer.clipsToBounds = true
        self.layer.maskedCorners = [.layerMaxXMaxYCorner,.layerMinXMaxYCorner]
         //self.layer.borderWidth = 0

     }
    
    
}
extension UIButton {
    
    func ButtonShadow() {
        self.layer.shadowOpacity = 1
         self.layer.shadowRadius = 1
         self.layer.cornerRadius = 6
         layer.shadowOffset = CGSize(width: 0.1, height: 0.3)
         self.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
           //self.layer.borderWidth = 0
       }
    func borderButton() {
        self.layer.borderWidth = 2
        self.layer.borderColor = #colorLiteral(red: 0.231372549, green: 0.3490196078, blue: 0.5960784314, alpha: 1)
              //self.layer.borderWidth = 0
          }
    func shake(){
      let animation = CABasicAnimation(keyPath: "position")
      animation.duration = 0.07
      animation.repeatCount = 3
      animation.autoreverses = true
      animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
      animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
      self.layer.add(animation, forKey: "position")
    }
    func adjustButtonSize() {
           titleLabel?.adjustsFontSizeToFitWidth = true
           titleLabel?.minimumScaleFactor = 0.5
       }
}
