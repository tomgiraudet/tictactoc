//
//  SoloModeLevelSelection.swift
//  Gam'Insa
//
//  Created by Tom Giraudet on 09/03/2015.
//  Copyright (c) 2015 Tom Giraudet. All rights reserved.
//

import Foundation
import UIKit

class SoloModeLevelSelection: GeneralView{
    
    var parent : UIViewController!
    
    let titre = UIImageView(image: UIImage(named: "Titre.png"))
    
    let backButtonImg = UIImage(named: "back.png")
    let backButton = UIButton()
    let slider = UISlider()
    let levelLabel = UILabel()
    let goButton = UIButton()
    
    let goButtonImg = UIImage(named: "launch_game.png")
    
    override func viewDidLoad() {
        
        // permet de charger le design de GeneralView
        super.viewDidLoad()
        
        var imageWidth = self.view.frame.size.width - ((20/100)*self.view.frame.size.width)
        var imageHeight = self.view.frame.size.height * (15/100)
        var space = (self.view.frame.size.height - titre.frame.origin.y + titre.frame.size.height - 3*(imageHeight))/4
        
        var x = (self.view.frame.size.width-imageWidth)/2
        var y = titre.frame.origin.y + titre.frame.size.height + space
        
        
        //Titre
        titre.sizeToFit()
        titre.frame = CGRectMake((self.view.frame.size.width-titre.frame.size.width)/2, 40, titre.frame.size.width, titre.frame.size.height)
        
        // Back Button
        backButton.setImage(backButtonImg, forState: .Normal)
        backButton.frame = CGRectMake (5, entete.frame.origin.y, 25, 25)
        backButton.addTarget(self, action: "back", forControlEvents: .TouchUpInside)
        
        // Slider
        slider.maximumValue = 3
        slider.minimumValue = 1
        slider.sizeToFit()
        slider.frame = CGRectMake((self.view.frame.size.width - slider.frame.size.width)/2, titre.frame.origin.y + titre.frame.size.height + 100, slider.frame.size.width, slider.frame.size.height)
        slider.addTarget(self, action: "sliderValueChanged:", forControlEvents: UIControlEvents.ValueChanged)
        
        // Go Button
        goButton.setImage(goButtonImg, forState: .Normal)
        goButton.sizeToFit()
        goButton.frame.origin.x = x
        goButton.frame.origin.y = backViewWhite.frame.height - 2*imageHeight
        goButton.frame.size.width = imageWidth
        goButton.frame.size.height = imageHeight
        goButton.addTarget(self, action: "goGame", forControlEvents: .TouchUpInside)
        
        
        //Initialisation
        self.view.addSubview(backButton)
        backViewWhite.addSubview(slider)
        backViewWhite.addSubview(levelLabel)
        backViewWhite.addSubview(goButton)
        
        
        
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
    
    func goGame(){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc = mainStoryboard.instantiateViewControllerWithIdentifier("SoloID") as SoloMode
        vc.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        vc.level = Int(slider.value)
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    func back(){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc = mainStoryboard.instantiateViewControllerWithIdentifier("ModeID") as ModeView
        vc.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
}