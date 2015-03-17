//
//  ModeView.swift
//  Gam'Insa
//
//  Created by Juliette Gonzalez on 07/03/2015.
//  Copyright (c) 2015 Tom Giraudet. All rights reserved.
//

import Foundation
import UIKit


class ModeView: GeneralView {
    
    var parent : UIViewController!
    
    let titre = UIImageView(image: UIImage(named: "Titre.png"))
    let soloMode = UIButton()
    let duoMode = UIButton()
    let multiMode = UIButton()
    let soloImage = UIImageView(image: UIImage(named: "solo.png"))
    let duoImage = UIImageView(image: UIImage(named: "duo.png"))
    let multiImage = UIImageView(image: UIImage(named: "multijoueur.png"))
    let choisis_ton_mode_de_jeu = UIImageView(image: UIImage(named: "choisis_ton_mode_de_jeu.png"))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var imageWidth = backViewWhite.frame.size.width - ((20/100)*backViewWhite.frame.size.width)
        var proportion = ((soloImage.frame.size.height)/(soloImage.frame.size.width))
        var imageHeight = proportion*imageWidth
    
        
        var space = 60 + choisis_ton_mode_de_jeu.frame.size.height
        
        
        var x = (backViewWhite.frame.size.width-imageWidth)/2
        var y = choisis_ton_mode_de_jeu.frame.origin.y + space

        
        
        // Selection mode de jeu 
        choisis_ton_mode_de_jeu.sizeToFit()
        choisis_ton_mode_de_jeu.frame.size.width = backViewWhite.frame.size.width * (80/100)
        choisis_ton_mode_de_jeu.frame.origin.x = (backViewWhite.frame.size.width-choisis_ton_mode_de_jeu.frame.size.width)/2
        choisis_ton_mode_de_jeu.frame.origin.y = 20
    
        
        //SoloIcon
        soloMode.setImage(UIImage (named: "solo.png"), forState: .Normal)
        soloMode.addTarget(self, action: "goSoloMode", forControlEvents: .TouchUpInside)
        soloMode.sizeToFit()
        soloMode.frame.origin.x = x
        soloMode.frame.origin.y = y 
        soloMode.frame.size.height = imageHeight
        soloMode.frame.size.width = imageWidth
        
        //DuoIcon
        duoMode.setImage(UIImage (named: "duo.png"), forState: .Normal)
        duoMode.addTarget(self, action: "goDuoMode", forControlEvents: .TouchUpInside)
        duoMode.sizeToFit()
        duoMode.frame.origin.x = x
        duoMode.frame.origin.y = y + imageHeight + (15/100)*imageHeight
        duoMode.frame.size.height = imageHeight
        duoMode.frame.size.width = imageWidth
        
        //MultiIcon
        multiMode.setImage(UIImage (named: "multijoueur.png"), forState: .Normal)
        multiMode.addTarget(self, action: "goMultiMode", forControlEvents: .TouchUpInside)
        multiMode.sizeToFit()
        multiMode.frame.origin.x = x
        multiMode.frame.origin.y = y + 2*imageHeight + (30/100)*imageHeight
        multiMode.frame.size.height = imageHeight
        multiMode.frame.size.width = imageWidth
        
        
        //Initialisation
        backViewWhite.addSubview(choisis_ton_mode_de_jeu)
        backViewWhite.addSubview(soloMode)
        backViewWhite.addSubview(duoMode)
        backViewWhite.addSubview(multiMode)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func goSoloMode() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc = mainStoryboard.instantiateViewControllerWithIdentifier("SoloLevelID") as SoloModeLevelSelection
        vc.parent = self
        vc.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    func goDuoMode() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc = mainStoryboard.instantiateViewControllerWithIdentifier("DuoID") as DuoMode
        vc.parent = self
        vc.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    
    func goMultiMode() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc = mainStoryboard.instantiateViewControllerWithIdentifier("MultiID") as MultiModeHome
        vc.parent = self
        vc.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    
}
