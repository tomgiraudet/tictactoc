//
//  Player.swift
//  Gam'Insa
//
//  Created by Juliette Gonzalez on 03/03/2015.
//  Copyright (c) 2015 Tom Giraudet. All rights reserved.
//

import Foundation
import UIKit


<<<<<<< HEAD
class Player:NSObject{

    var name:String!
    var icon:UIImageView!
    
    func createPlayer (name:String, img:String){
        self.name = name
        self.icon = UIImageView(image: UIImage(named: img))
    }
    
=======
class Player {

    var name : String
    var icon : UIImage
    
    func init (){
        name = "player"
        icon = UIImage(named: <#String#>)
    }
    
    
>>>>>>> f232a0b33c98964db68e0f853f3388e3d2708d9f
}