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


    var player : Player?
    var activate : Bool = false
    var i : Int = 0
    var j : Int = 0
    
   /* override init(){
        super.init()
    }*/
    
    func initView (i : Int, j : Int){
        self.i = i
        self.j = j
        self.player = nil
        self.activate = false
    }
    
    // Affiche l'icone du joueur sur la case qu'il vient de jouer
    func placeCase (player : Player){
        var playedImage = UIImageView(image: player.icon.image)
        
        playedImage.frame.size.width = self.frame.size.width
        playedImage.frame.size.height = self.frame.size.height
        playedImage.frame.origin.x=self.frame.origin.x
        playedImage.frame.origin.y=self.frame.origin.y

        self.addSubview(playedImage)
    }
    
}