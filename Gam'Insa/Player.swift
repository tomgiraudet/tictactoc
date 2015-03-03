//
//  Player.swift
//  Gam'Insa
//
//  Created by Juliette Gonzalez on 03/03/2015.
//  Copyright (c) 2015 Tom Giraudet. All rights reserved.
//

import Foundation
import UIKit


class Player {

    var name : String = ""
    var icon : UIImageView = UIImageView(image: UIImage(named: "x"))
    
    func createPlayer (name : String, img : String){
        self.name = name
        icon = UIImageView(image: UIImage(named: img))
    }
    
}