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
        var y = titre.frame.origin.y + titre.frame.size.height + space
        
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
        settingsProfil.frame = CGRectMake(x, y, imageWidth, imageHeight)
        

        
        settingsCreerPartie.setImage(settingsCreerPartieImg, forState: .Normal)
        settingsCreerPartie.sizeToFit()
        settingsCreerPartie.frame = CGRectMake(x, y + settingsProfil.frame.size.height, imageWidth, imageHeight)
        
        
        settingsDuoMode.setImage(settingsDuoModeImg, forState: .Normal)
        settingsDuoMode.sizeToFit()
        settingsDuoMode.frame = CGRectMake(x, y + settingsProfil.frame.size.height + settingsCreerPartie.frame.size.height , imageWidth, imageHeight)
        
        settingsQuitterPartie.setImage(settingsQuitterPartieImg, forState: .Normal)
        settingsQuitterPartie.sizeToFit()
        settingsQuitterPartie.frame = CGRectMake(x, y + settingsProfil.frame.size.height + settingsCreerPartie.frame.size.height + settingsDuoMode.frame.size.height , imageWidth, imageHeight)
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
    

