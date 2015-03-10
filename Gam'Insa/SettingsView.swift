//
//  SettingsView.swift
//  Gam'Insa
//
//  Created by Tom Giraudet on 08/03/2015.
//  Copyright (c) 2015 Tom Giraudet. All rights reserved.
//

import Foundation
import UIKit

class SettingsView: ModeView {
    
    var runningGame: TicTacToc!
    
    let settingsProfil = UIButton()
    let settingsCreerPartie = UIButton()
    let settingsDuoMode = UIButton()
    let settingsQuitterPartie = UIButton()
    let backButton = UIButton()
    
    let settingsProfilImg = UIImage(named: "SettingsProfil.png")
    let settingsCreerPartieImg = UIImage(named: "SettingsCreerPartie.png")
    let settingsDuoModeImg = UIImage(named: "SettingsModeDuo.png")
    let settingsQuitterPartieImg = UIImage(named: "SettingsQuitterPartie.png")
    let backButtonImg = UIImage(named: "back.png")

    override func viewDidLoad() {

        var imageWidth = self.view.frame.size.width - ((15/100)*self.view.frame.size.width)
        var proportion = ((settingsProfilImg?.size.height)!/(settingsProfilImg?.size.width)!)
        var imageHeight = proportion*imageWidth
        
        var space = (self.view.frame.size.height - titre.frame.origin.y + titre.frame.size.height - 4*(imageHeight))/5
        
        var x = (self.view.frame.size.width-imageWidth)/2
        var y = CGFloat(100) //+ space
        
        //Titre
        titre.sizeToFit()
        titre.frame = CGRectMake((self.view.frame.size.width-titre.frame.size.width)/2, 20, titre.frame.size.width, titre.frame.size.height)
        
        //Background
        background.frame.size.width = self.view.frame.size.width
        background.frame.size.height = self.view.frame.size.height
        

        // Button
        backButton.setImage(backButtonImg, forState: .Normal)
        backButton.frame = CGRectMake (5, 20, 25, 25)
        backButton.addTarget(self, action: "back", forControlEvents: .TouchUpInside)
        
        
        settingsProfil.setImage(settingsProfilImg, forState: .Normal)
        settingsProfil.sizeToFit()
        settingsProfil.frame.origin.x = x
        settingsProfil.frame.origin.y = y
        settingsProfil.frame.size.height = imageHeight
        settingsProfil.frame.size.width = imageWidth
        
        
        settingsCreerPartie.setImage(settingsCreerPartieImg, forState: .Normal)
        settingsCreerPartie.sizeToFit()
        settingsCreerPartie.frame.origin.x = x
        settingsCreerPartie.frame.origin.y = y + imageHeight + (5/100)*imageHeight
        settingsCreerPartie.frame.size.height = imageHeight
        settingsCreerPartie.frame.size.width = imageWidth
    
        
        settingsDuoMode.setImage(settingsDuoModeImg, forState: .Normal)
        settingsDuoMode.sizeToFit()
        settingsDuoMode.frame.origin.x = x
        settingsDuoMode.frame.origin.y = y + 2*imageHeight + (10/100)*imageHeight
        settingsDuoMode.frame.size.height = imageHeight
        settingsDuoMode.frame.size.width = imageWidth
        
        
        settingsQuitterPartie.setImage(settingsQuitterPartieImg, forState: .Normal)
        settingsQuitterPartie.sizeToFit()
        settingsQuitterPartie.frame.origin.x = x
        settingsQuitterPartie.frame.origin.y = y + 3*imageHeight + (15/100)*imageHeight
        settingsQuitterPartie.frame.size.height = imageHeight
        settingsQuitterPartie.frame.size.width = imageWidth
        settingsQuitterPartie.addTarget(self, action: "quitterPartie", forControlEvents: .TouchUpInside)
        
        //Initialisation
        self.view.addSubview(background)
        //self.view.addSubview(titre)
        self.view.addSubview(backButton)
        self.view.addSubview(settingsProfil)
        self.view.addSubview(settingsCreerPartie)
        self.view.addSubview(settingsDuoMode)
        self.view.addSubview(settingsQuitterPartie)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func back(){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc = mainStoryboard.instantiateViewControllerWithIdentifier("DuoID") as DuoMode
        vc.settingsParent = self
        vc.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    func quitterPartie(){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc = mainStoryboard.instantiateViewControllerWithIdentifier("ModeID") as ModeView
        vc.parent = self
        vc.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        self.presentViewController(vc, animated: true, completion: nil)
    }

    
}
    

