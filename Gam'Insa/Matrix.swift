//
//  Matrix.swift
//  Gam'Insa
//
//  Created by Tom Giraudet on 05/03/2015.
//  Copyright (c) 2015 Tom Giraudet. All rights reserved.
//

import Foundation
import UIKit



class Matrix:NSObject{
    
    var papaDuo : DuoMode?
    var mat:Array<Array<Player>>!
    
    func createMatrix(){
        var column : Int
        mat = Array<Array<Player>>()
        for column in 0...2 {
            var _player = Player()
            mat.append(Array(count:3, repeatedValue:_player))
        }
    }
    
    
    func addCase(i: Int, j: Int, _player: Player){
        mat[i][j] = _player
        for u in 0...2 {
            for v in 0...2{
            }
        }
    }
    
    // Détermine état du jeu (0: en cours, 1: gagné, 2:tie)
    func matrixGagnante() -> (Int, String){
        
        var winnableTotal: Int = 0
        var winner: String
        var tie = 0
        
        if (diagonaleGagnanteDroite().0 == 1){
            winnableTotal = 1
            winner = diagonaleGagnanteDroite().1
            return (winnableTotal,winner)
        }else{
            if (diagonaleGagnanteGauche().0 == 1){
                winnableTotal = 1
                winner = diagonaleGagnanteGauche().1
                return (winnableTotal,winner)
            }else{
                if (ligneGagnante().0 == 1){
                    winnableTotal = 1
                    winner = ligneGagnante().1
                    return (winnableTotal,winner)
                }else{
                    if (colonneGagnante().0 == 1){
                        winnableTotal = 1
                        winner = colonneGagnante().1
                        return (winnableTotal,winner)
                    }else{
                        //println("elseTotal")
                        for i in 0...2 {
                            for j in 0...2{
                                if (mat[i][j].name==nil){
                                    return (0,"")
                                }
                            }
                        }
                        return (2,"")
                    }
                }
            }
        }
    }
    
    
    func diagonaleGagnanteDroite() ->(Int, String){
        var winnable: Int = 1
        var player: String
        
        if !(self.mat[0][0].name == nil) {
                player = self.mat[0][0].name
                for i in 1...2 {
                    if(self.mat[i][i].name != player){
                        winnable = 0
                        player = ""
                        return (winnable, player)
                    }
            }
            return (winnable, player)
        }
        return (0, "")
    }
    
    
    func diagonaleGagnanteGauche() ->(Int, String){
        var winnable: Int = 1
        var player: String
        
        if(self.mat[2][0].name != nil){
            player = self.mat[2][0].name
            for i in 1...2 {
                if(self.mat[2-i][i].name != player){
                    winnable = 0
                    player = ""
                    return (winnable, player)
                }
            }
            return (winnable, player)
        }
        return (0, "")
    }
    
    
    func colonneGagnante() ->(Int,String) {
        var winnable: Int = 1
        var player: String
        
        for j in 0...2 {
            winnable = 1
            if(self.mat[0][j].name != nil){
                player = self.mat[0][j].name
                for i in 1...2{
                    if(self.mat[i][j].name != player){
                        winnable = 0
                        player = ""
                    }
                }
                if (winnable == 1) {
                    return (winnable, player)

                }
            }
            
        }
        return (0, "")
    }
    
    
    func ligneGagnante() ->(Int,String) {
        var winnable: Int = 1
        var player: String
        
        for j in 0...2 {
            winnable = 1
            if(self.mat[j][0].name != nil){
                player = self.mat[j][0].name
                for i in 1...2{
                    if(self.mat[j][i].name != player){
                        winnable = 0
                        player = ""
                    }
                }
                if (winnable == 1) {
                    return (winnable, player)
                }
            }
            
        }
        return (0, "")
    }
    
    
    func easyGame(_matCase: Array<Array<Case>>) -> (Int, Int) {
        println("Debut func easyGame")
        var played = false
        println("\(played)")
        var i = -1
        var j = -1
        while !(played) {
            // Gives a number between 0 and 2
            i = Int(arc4random_uniform(3))
            j = Int(arc4random_uniform(3))
            println("Case proposée : \(i);\(j) et played : \(played)")
            var caseRandom = Case()
            if _matCase[i][j].player == nil{
                played = true
            }
        }
        return (i,j)
    }
    
    func mediumGame() -> (Int, Int) {
        return (1, 1)
    }
    
    func hardGame() -> (Int, Int) {
        return (1,1)
        }
    
    
}