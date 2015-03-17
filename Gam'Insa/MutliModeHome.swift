//
//  MutliModeHome.swift
//  Gam'Insa
//
//  Created by Tom Giraudet on 17/03/2015.
//  Copyright (c) 2015 Tom Giraudet. All rights reserved.
//

import Foundation
import UIKit
//import Socket_IO_Client_Swift


class MultiModeHome: GeneralView{
    
    var parent : UIViewController!

    let backButtonImg = UIImage(named: "back.png")
    let backButton = UIButton()
    let send = UIButton()
    let textBox = UITextView()
    let socket = SocketIOClient(socketURL: "http://ysabell.deuxfleurs.fr")
    
    
    let goButtonImg = UIImage(named: "launch_game.png")
    
    override func viewDidLoad() {
        
        // permet de charger le design de GeneralView
        super.viewDidLoad()
        
        // Back Button
        backButton.setImage(backButtonImg, forState: .Normal)
        backButton.frame = CGRectMake (5, entete.frame.origin.y, 25, 25)
        backButton.addTarget(self, action: "back", forControlEvents: .TouchUpInside)
        
        // Textbox
        textBox.frame = CGRectMake(10, 10, backViewWhite.frame.size.width-20, 150)
        textBox.layer.borderWidth = 2
        textBox.layer.borderColor = greyColor.CGColor
        
        // Send Button
        send.frame = CGRectMake (10, textBox.frame.origin.y + 200, backViewWhite.frame.size.width-20, 50)
        send.addTarget(self, action: "sendMessage", forControlEvents: .TouchUpInside)
        send.titleLabel?.text = "Envoyer"
        send.titleLabel?.textAlignment = .Center
        send.titleLabel?.textColor = generalColor
        send.layer.borderWidth = 2
        send.layer.borderColor = greyColor.CGColor

        //Initialisation
        self.view.addSubview(backButton)
        backViewWhite.addSubview(textBox)
        backViewWhite.addSubview(send)
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sendMessage(){
        println("Message to send : \(textBox.text)")
    }
    
    func back(){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc = mainStoryboard.instantiateViewControllerWithIdentifier("ModeID") as ModeView
        vc.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
}