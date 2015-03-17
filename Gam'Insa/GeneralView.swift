//
//  GeneralView.swift
//  Gam'Insa
//
//  Created by Tom Giraudet on 12/03/2015.
//  Copyright (c) 2015 Tom Giraudet. All rights reserved.
//

import Foundation
import UIKit



class GeneralView: UIViewController{
    
    var backViewGrey = UIView()
    var backViewWhite = UIView()
    var whiteColor = UIColor.whiteColor()
    var greyColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
    var entete = UILabel()
    var generalColor = UIColor(red: 198.0/255.0, green: 40.0/255.0, blue: 40.0/255.0, alpha: 1) // rouge
    //var generalColor = UIColor(red: 253.0/255.0, green: 216/255.0, blue: 53.0/255.0, alpha: 1) // jaune
    //var generalColor = UIColor(red: 255.0/255.0, green: 112/255.0, blue: 57.0/255.0, alpha: 1) // corail
    var cornerRadius = CGFloat(10)

    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = generalColor
        
        entete.frame.size.width = self.view.frame.size.width
        entete.frame.size.height = 40
        entete.frame.origin.x = (self.view.frame.size.width-entete.frame.size.width)/2
        entete.frame.origin.y = 20
        entete.font = UIFont(name: "Phosphate", size: 45)!
        entete.textAlignment = .Center
        entete.textColor = whiteColor
        entete.text = "GAM'INSA"
        
        backViewGrey.backgroundColor = greyColor
        backViewGrey.frame = CGRect(x: 5, y: 65, width: self.view.frame.size.width-10, height: self.view.frame.size.height-70)
        backViewGrey.layer.cornerRadius = self.cornerRadius
        
        backViewWhite = UIView()
        backViewWhite.backgroundColor = .whiteColor()
        backViewWhite.frame = CGRect(x:5, y:65, width: backViewGrey.frame.size.width, height: backViewGrey.frame.size.height)
        backViewWhite.layer.cornerRadius = self.cornerRadius
        backViewWhite.layer.borderWidth = 2
        backViewWhite.layer.borderColor = greyColor.CGColor
        
        // Initialisation
        self.view.addSubview(entete)
//        backViewGrey.addSubview(backViewWhite)
        self.view.addSubview(backViewWhite)
//        self.view.addSubview(backViewGrey)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}