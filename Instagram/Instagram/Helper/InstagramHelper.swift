//
//  InstagramHelper.swift
//  Instagram
//
//  Created by Anthony Ankit on 17/09/20.
//  Copyright © 2020 Anthony Ankit. All rights reserved.
//

import UIKit

class InstagramHelper {
    public static func screenBackground(view:UIView){
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(origin: CGPoint.zero , size: CGSize (width: view.frame.size.width,height: view.frame.size.height))
        gradient.colors = [UIColor(red: 245/255, green: 133/255, blue: 41/255, alpha: 1.0).cgColor,
                           UIColor(red: 254/255, green: 218/255, blue: 119/255, alpha: 1.0).cgColor,
                           UIColor(red: 221/255, green: 42/255, blue: 123/255, alpha: 1.0).cgColor,
                           UIColor(red: 129/255, green: 52/255, blue: 175/255, alpha: 1.0).cgColor,
                           UIColor(red: 81/255, green: 91/255, blue: 212/255, alpha: 1.0).cgColor]
        view.layer.masksToBounds = true
        view.layer.addSublayer(gradient)
    }
    
    public static func gredientBorderRadius(imageView: UIImageView){
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(origin: CGPoint.zero , size: imageView.bounds.size)
        gradient.colors = [UIColor(red: 245/255, green: 133/255, blue: 41/255, alpha: 1.0).cgColor,
                           UIColor(red: 254/255, green: 218/255, blue: 119/255, alpha: 1.0).cgColor,
                           UIColor(red: 221/255, green: 42/255, blue: 123/255, alpha: 1.0).cgColor,
                           UIColor(red: 129/255, green: 52/255, blue: 175/255, alpha: 1.0).cgColor,
                           UIColor(red: 81/255, green: 91/255, blue: 212/255, alpha: 1.0).cgColor]
        let shape = CAShapeLayer()
        shape.lineWidth = 6
        shape.path = UIBezierPath(roundedRect: imageView.bounds, cornerRadius: imageView.layer.cornerRadius).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape
        imageView.layer.addSublayer(gradient)
        imageView.clipsToBounds = true
    }
    
    public static func controllerLeftToRightNavigation(view : UIView){
        let transition = CATransition()
               transition.duration = 0.5
               transition.type = CATransitionType.push
               transition.subtype = CATransitionSubtype.fromLeft
               transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
               view.window?.layer.add(transition, forKey: kCATransition)
    }
    
}


