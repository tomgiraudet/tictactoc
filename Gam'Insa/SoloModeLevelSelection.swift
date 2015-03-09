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
    let slider = UISlider()
    let levelLabel = UILabel()
    
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
        
        // Slider
        slider.maximumValue = 3
        slider.minimumValue = 1
        slider.sizeToFit()
        slider.frame = CGRectMake((self.view.frame.size.width - slider.frame.size.width)/2, titre.frame.origin.y + titre.frame.size.height + 100, slider.frame.size.width, slider.frame.size.height)
        slider.addTarget(self, action: "sliderValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
        
        //Initialisation
        self.view.addSubview(background)
        self.view.addSubview(titre)
        self.view.addSubview(backButton)
        self.view.addSubview(slider)
        self.view.addSubview(levelLabel)
        
        
        
    }
    
    func sliderValueChanged(sender: UISlider) {
        var level = Int(slider.value)
        levelLabel.sizeToFit()
        levelLabel.frame.size.width = self.view.frame.size.width * (50/100)
        levelLabel.frame.size.height = self.view.frame.size.height * (40/100)
        
        levelLabel.text = "\(level)"
        levelLabel.frame = CGRectMake ((self.view.frame.size.width - levelLabel.frame.size.width)/2, titre.frame.origin.y + 30, levelLabel.frame.size.width, levelLabel.frame.size.height)
        levelLabel.textAlignment = .Center
        levelLabel.textColor = .blackColor()
        levelLabel.font = UIFont(name: levelLabel.font.fontName, size: 90)
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func back(){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc = mainStoryboard.instantiateViewControllerWithIdentifier("ModeID") as ModeView
        vc.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
}