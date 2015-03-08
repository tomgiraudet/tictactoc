//
//  SettingsView.swift
//  Gam'Insa
//
//  Created by Tom Giraudet on 08/03/2015.
//  Copyright (c) 2015 Tom Giraudet. All rights reserved.
//

import Foundation
import UIKit

class SettingsView: ViewController {
    
    var runningGame: ViewController!
    
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
        
        
        settingsProfil.setImage(settingsProfilImg, forState: .Normal)
        settingsProfil.sizeToFit()
        settingsProfil.frame = CGRectMake ((self.view.frame.size.width - settingsProfil.frame.size.width)/2, titre.frame.origin.y + titre.frame.size.height + 40, settingsProfil.frame.size.width, settingsProfil.frame.size.height)
        
        settingsCreerPartie.setImage(settingsCreerPartieImg, forState: .Normal)
        settingsCreerPartie.sizeToFit()
        settingsCreerPartie.frame = CGRectMake ((self.view.frame.size.width - settingsCreerPartie.frame.size.width)/2, settingsProfil.frame.origin.y + settingsProfil.frame.size.height + 20, settingsCreerPartie.frame.size.width, settingsCreerPartie.frame.height)
        
        settingsDuoMode.setImage(settingsDuoModeImg, forState: .Normal)
        settingsDuoMode.sizeToFit()
        settingsDuoMode.frame = CGRectMake ((self.view.frame.size.width - settingsDuoMode.frame.size.width)/2, settingsCreerPartie.frame.origin.y + settingsCreerPartie.frame.size.height + 20, settingsDuoMode.frame.size.width, settingsDuoMode.frame.size.height)
        
        settingsQuitterPartie.setImage(settingsQuitterPartieImg, forState: .Normal)
        settingsQuitterPartie.sizeToFit()
        settingsQuitterPartie.frame = CGRectMake((self.view.frame.size.width - settingsProfil.frame.size.width)/2, settingsDuoMode.frame.origin.y + settingsDuoMode.frame.size.height + 20, settingsQuitterPartie.frame.size.width, settingsQuitterPartie.frame.size.height)
        settingsQuitterPartie.addTarget(self, action: "quitterPartie", forControlEvents: .TouchUpInside)
        
        //Initialisation
        self.view.addSubview(background)
        self.view.addSubview(titre)
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
        let vc = mainStoryboard.instantiateViewControllerWithIdentifier("SoloID") as ViewController
        vc.settingsParent = self
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    func quitterPartie(){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc = mainStoryboard.instantiateViewControllerWithIdentifier("ModeID") as ModeView
        vc.parent = self
        self.presentViewController(vc, animated: true, completion: nil)
    }

    
}
    

