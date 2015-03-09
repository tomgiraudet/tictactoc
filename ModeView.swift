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
        
        // ModeInfo
        modeInfo.frame = CGRectMake(10, titre.frame.size.height+40, self.view.frame.width-20, 50)
        modeInfo.text = "Choisis ton mode de jeu !"
        modeInfo.textAlignment = .Center
        modeInfo.textColor = UIColor.blackColor()
        
        //SoloIcon
        soloMode.sizeToFit()
        
        soloMode.frame=CGRectMake(x, y, imageWidth, imageHeight)
        soloMode.setImage(UIImage (named: "solo.png"), forState: .Normal)
        soloMode.addTarget(self, action: "goSoloMode", forControlEvents: .TouchUpInside)
        
        //DuoIcon
        duoMode.sizeToFit()
        
        duoMode.frame=CGRectMake(x, y + soloMode.frame.size.height, imageWidth, imageHeight)
        duoMode.setImage(UIImage (named: "duo.png"), forState: .Normal)
        duoMode.addTarget(self, action: "goDuoMode", forControlEvents: .TouchUpInside)
        
        //MultiIcon
        multiMode.sizeToFit()
        
       multiMode.frame=CGRectMake(x, y + duoMode.frame.size.height + soloMode.frame.size.height, imageWidth, imageHeight)
        multiMode.setImage(UIImage (named: "multijoueur.png"), forState: .Normal)
        
        
        //Initialisation
        self.view.addSubview(background)
        self.view.addSubview(titre)
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
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    func goDuoMode() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc = mainStoryboard.instantiateViewControllerWithIdentifier("DuoID") as DuoMode
        vc.parent = self
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    
}
