//
//  SoloModeLevelSelection.swift
//  Gam'Insa
//
//  Created by Tom Giraudet on 09/03/2015.
//  Copyright (c) 2015 Tom Giraudet. All rights reserved.
//

import Foundation
import UIKit

class SoloModeLevelSelection: UIViewController{
    
    var parent : UIViewController!
    
    let titre = UIImageView(image: UIImage(named: "Titre.png"))
    let background = UIImageView(image: UIImage(named: "background.png"))
    
    let backButtonImg = UIImage(named: "back.png")
    let backButton = UIButton()
    
    override func viewDidLoad() {
        
        var imageWidth = self.view.frame.size.width - ((20/100)*self.view.frame.size.width)
        var imageHeight = self.view.frame.size.height * (15/100)
        var space = (self.view.frame.size.height - titre.frame.origin.y + titre.frame.size.height - 3*(imageHeight))/4
        
        var x = (self.view.frame.size.width-imageWidth)/2
        var y = titre.frame.origin.y + titre.frame.size.height + space
        
        
        //Titre
        titre.sizeToFit()
        titre.frame = CGRectMake((self.view.frame.size.width-titre.frame.size.width)/2, 40, titre.frame.size.width, titre.frame.size.height)
        
        //Background
        background.frame.size.width = self.view.frame.size.width
        background.frame.size.height = self.view.frame.size.height
        
        // Button
        backButton.setImage(backButtonImg, forState: .Normal)
        backButton.frame = CGRectMake (5, 20, 25, 25)
        backButton.addTarget(self, action: "back", forControlEvents: .TouchUpInside)
        
        //Initialisation
        self.view.addSubview(background)
        self.view.addSubview(titre)
        self.view.addSubview(backButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func back(){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc = mainStoryboard.instantiateViewControllerWithIdentifier("ModeID") as ModeView
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
}