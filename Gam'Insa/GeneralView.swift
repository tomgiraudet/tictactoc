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

    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
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
        backViewGrey.layer.cornerRadius = 10
        
        backViewWhite.backgroundColor = .whiteColor()
        backViewWhite.frame = CGRect(x:2, y:2, width: backViewGrey.frame.size.width-4, height: backViewGrey.frame.size.height-4)
        backViewWhite.layer.cornerRadius = 10
        
        // Initialisation
        self.view.addSubview(entete)
        backViewGrey.addSubview(backViewWhite)
        self.view.addSubview(backViewGrey)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}