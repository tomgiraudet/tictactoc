//
//  Player.swift
//  Gam'Insa
//
//  Created by Juliette Gonzalez on 03/03/2015.
//  Copyright (c) 2015 Tom Giraudet. All rights reserved.
//

import Foundation
import UIKit



class Player:NSObject{

    var name:String!
    var icon:UIImage!
    var score: UInt8 = 0
    var profilPic: UIImage!
    
    func createPlayer (name:String, img:String){
        self.name = name
        self.icon = UIImage(named: img)
        self.score = 0
        self.profilPic = UIImage(named: "default_profilpic.png")
    }
    
}