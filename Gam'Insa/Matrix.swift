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
    
    var papa : ViewController?
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
        println("Case ajoutée à la matrice")
        for u in 0...2 {
            for v in 0...2{
            println("mat[\(u)][\(v)] =\(mat[u][v].name)")
            }
        }
    }
    
    func matrixGagnante() -> (Int, String){
        
        var winnableTotal: Int = 0
        var winner: String
        
        println("début matrixGagnante")
        
        if (diagonaleGagnanteDroite().0 == 1){
            winnableTotal = 1
            winner = diagonaleGagnanteDroite().1
            println("diagonaleDroiteTotal")
            return (winnableTotal,winner)
        }else{
            if (diagonaleGagnanteGauche().0 == 1){
                winnableTotal = 1
                winner = diagonaleGagnanteGauche().1
                println("diagonaleGaucheTotal")
                return (winnableTotal,winner)
            }else{
                if (ligneGagnante().0 == 1){
                    winnableTotal = 1
                    winner = ligneGagnante().1
                    println("ligneTotal")
                    return (winnableTotal,winner)
                }else{
                    if (colonneGagnante().0 == 1){
                        winnableTotal = 1
                        winner = colonneGagnante().1
                        println("colonneTotal")
                        return (winnableTotal,winner)
                    }else{
                        //println("elseTotal")
                        return (0,"")
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
            println("diagonale gagnée")
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
            println("diagonale gagnée")
            return (winnable, player)
        }
        return (0, "")
    }
    
    
    func colonneGagnante() ->(Int,String) {
        var winnable: Int = 1
        var player: String
        
        for j in 0...2 {
            winnable = 1 // si tu ne le remets pas à 1 à chaque début de ligne, les lignes 1 et 2 ne pourront jamais gagner
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
                    println("Colonne gagnante")
                }
            }
            
        }
        return (0, "")
    }
    
    
    func ligneGagnante() ->(Int,String) {
        var winnable: Int = 1
        var player: String
        
        for j in 0...2 {
            winnable = 1 // si tu ne le remets pas à 1 à chaque début de ligne, les lignes 1 et 2 ne pourront jamais gagner
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
                    println("ligne gagnante")
                }
            }
            
        }
        return (0, "")
    }
    
    
}