//
//  Case.swift
//  Gam'Insa
//
//  Created by Juliette Gonzalez on 03/03/2015.
//  Copyright (c) 2015 Tom Giraudet. All rights reserved.
//

import Foundation
import UIKit

class Case: UIView {

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var player : Player
    var activate : Bool = false
    var i : Int = 0
    var j : Int = 0
    
    
    func placeCase (i: Int, j: Int, player : Player){
        var playedImage = player.icon
        
        let x = i*10 //+ heighScreen
        let y = j*10 //+ moitiéCase
        
<<<<<<< HEAD
        playedImage.frame = CGRect(x: x, y: y, width: 10, height: 10)
=======
        playedImage.frame = CGRectMake(245, 5, 30, 30)
>>>>>>> cfcde1f469ec3c33a235e087194044a8bc6957f3
        

    }
    
}