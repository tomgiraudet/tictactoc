//
//  ModeView.swift
//  Gam'Insa
//
//  Created by Juliette Gonzalez on 07/03/2015.
//  Copyright (c) 2015 Tom Giraudet. All rights reserved.
//

import Foundation
import UIKit


class ModeView: UIViewController {
    
    var parent : UIViewController!
    
    let titre = UIImageView(image: UIImage(named: "Titre.png"))
    let background = UIImageView(image: UIImage(named: "background.png"))
    let modeInfo = UILabel()
    
    let soloMode = UIButton()
    let duoMode = UIButton()
    let multiMode = UIButton()
    
    let soloImage = UIImageView(image: UIImage(named: "solo.png"))
    let duoImage = UIImageView(image: UIImage(named: "duo.png"))
    let multiImage = UIImageView(image: UIImage(named: "multijoueur.png"))
    
    override func viewDidLoad() {
        
        var imageWidth = self.view.frame.size.width - ((20/100)*self.view.frame.size.width)
        var proportion = ((soloImage.frame.size.height)/(soloImage.frame.size.width))
        var imageHeight = proportion*imageWidth
    
        
        var space = (self.view.frame.size.height - modeInfo.frame.origin.y + modeInfo.frame.size.height - 3*(imageHeight))/4
        
        
        var x = (self.view.frame.size.width-imageWidth)/2
        var y = 100 + modeInfo.frame.origin.y + modeInfo.frame.size.height + modeInfo.frame.size.height + space

        
        
        //Background
        background.frame.size.width = self.view.frame.size.width
        background.frame.size.height = self.view.frame.size.height
    
        // ModeInfo
        modeInfo.frame = CGRectMake(10, 100, self.view.frame.width-20, 50)
        modeInfo.text = "Choisis ton mode de jeu !"
        modeInfo.textAlignment = .Center
        modeInfo.textColor = UIColor.blackColor()
        
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
        multiMode.sizeToFit()
        multiMode.frame.origin.x = x
        multiMode.frame.origin.y = y + 2*imageHeight + (30/100)*imageHeight
        multiMode.frame.size.height = imageHeight
        multiMode.frame.size.width = imageWidth
        
        
        //Initialisation
        self.view.addSubview(background)
        //self.view.addSubview(titre)
        self.view.addSubview(modeInfo)
        self.view.addSubview(soloMode)
        self.view.addSubview(duoMode)
        self.view.addSubview(multiMode)
        
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
    
}
