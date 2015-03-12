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
    var tapRec = UITapGestureRecognizer()
    var papa : TicTacToc?
    
    
   /* override init(){
        super.init()
    }*/
    
    func initView (i : Int, j : Int, _papa: TicTacToc){
        self.i = i
        self.j = j
        self.papa = _papa
        self.player = nil
        self.activate = false
        tapRec.addTarget(self, action: "touchedCase:")
        self.addGestureRecognizer(tapRec)
    }
    
    // Affiche l'icone du joueur sur la case qu'il vient de jouer
    func placeCase (player : Player){
        //self.backgroundColor = .blackColor()
        
        var playedImage = UIImageView(image:player.icon)
        playedImage.frame.size.width = self.frame.size.width * (80/100)
        playedImage.frame.size.height = self.frame.size.height * (80/100)
        playedImage.frame.origin.x = 16 - CGFloat((self.j))*6
        playedImage.frame.origin.y = 17
        

        self.addSubview(playedImage)
        
    }
    
    func setPlayer(_player: Player){
        self.player = _player
    }
    
    func touchedCase(_caseJouee: Case) {
        println("case touched")
        self.papa?.caseJouee(self)
    }
    
    
    
}