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
        
        var ratio = ((self.view.frame.size.width)/(self.view.frame.size.height))
        
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
        
        soloMode.frame=CGRectMake( (self.view.frame.size.width)/2 - ((soloImage.frame.size.width)*(30/100)/2), modeInfo.frame.origin.y +  modeInfo.frame.size.height + 20,(soloImage.frame.size.width)*(30/100),(soloImage.frame.size.height)*(38/100))
        soloMode.setImage(UIImage (named: "solo.png"), forState: .Normal)
        
        //DuoIcon
        duoMode.sizeToFit()
        
        duoMode.frame=CGRectMake( (self.view.frame.size.width)/2 - ((duoImage.frame.size.width)*(35/100)/2), modeInfo.frame.origin.y +  modeInfo.frame.size.height + soloMode.frame.size.height + 20 + 10, (duoImage.frame.size.width)*(35/100),(duoImage.frame.size.height)*(38/100))
        duoMode.setImage(UIImage (named: "duo.png"), forState: .Normal)
        duoMode.addTarget(self, action: "goSoloMode", forControlEvents: .TouchUpInside)
        
        //MultiIcon
        multiMode.sizeToFit()
        
        multiMode.frame=CGRectMake( (self.view.frame.size.width)/2 - (multiImage.frame.size.width)*(30/100)/2, modeInfo.frame.origin.y +  modeInfo.frame.size.height + soloMode.frame.size.height + duoMode.frame.size.height + 20 + 20 , (multiImage.frame.size.width)*(30/100),(multiImage.frame.size.height)*(35/100))
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
    
    let addItemAlertViewTag = 0
    let addItemTextAlertViewTag = 1
    
    func goSoloMode() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc = mainStoryboard.instantiateViewControllerWithIdentifier("SoloID") as ViewController
        vc.parent = self
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    
}
