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
    //var mat: [[Player]]!
    
    
    func createMatrix(){
        var column : Int
        mat = Array<Array<Player>>()
        for column in 0...2 {
            mat.append(Array(count:3, repeatedValue:Player()))
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
        var winner: String = ""
        
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
                        println("elseTotal")
                        return (0,"")
                    }
                }
            }
        }
    }
    
    // Marche
    func diagonaleGagnanteDroite() ->(Int, String){
        var winnable: Int = 1
        var player: String
        
        if(!(self.mat[0][0].name == nil)){
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
    
    //Marche
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
    
    //Marche pour la première colonne mais pas les autres (2e marche des fois)
    func colonneGagnante() ->(Int,String) {
        var winnable: Int = 1
        var player: String
        
        for j in 0...2 {
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
    
    
    
    
    
/*    func diagonaleGagnante() ->(Int, String){
        var winnable: Int = 1
        var actualSerie: String
        
         println("diagonale")
        
        // première diagonale
        if (self.mat[0][0].name == nil){
            winnable = 0
           return (winnable,"")
        }else{
            actualSerie = self.mat[0][0].name
            for i in 1...2{
                if !(self.mat[i][i] == actualSerie){
                    winnable = 0
                    println("ok")
                // La diagonale ne peut plus être valide
                }
            }
            
            if (winnable == 1){
                return (winnable,actualSerie)
                // C'est gagné
            }else{
                
                // seconde diagonale
                if !(self.mat[0][2].name == nil){
                    winnable = 1
                    actualSerie = self.mat[0][2].name
                    
                    for i in 1...2{
                        if !(self.mat[i][2-i].name == actualSerie) {
                            winnable = 0
                        }
                    }
                }
            }
        }
        if winnable == 1{
            return(winnable, actualSerie)
        }else{
            return(winnable, "")
        }
    }
*/
    
    
/*    func colonneGagnante() ->(Int,String){
        var winnable: Int = 1
        var actualSerie: String
        for i in 0...2 {
            if !(self.mat[i][0].name == nil) {
                actualSerie = self.mat[i][0].name
                for j in 1...2 {
                    if self.mat[i][j] != actualSerie {
                        winnable = 0
                    }
                }
                if winnable == 1{
                    println("C'est gagné !")
                    return (1,actualSerie)
                }
            }
           
        }
        return (0,"")
        }
*/
    
    func ligneGagnante() ->(Int,String){
        var winnable: Int = 1
        var actualSerie: String
        for i in 0...2 {
            if !(self.mat[0][i].name == nil) {
                actualSerie = self.mat[0][i].name
                for j in 1...2 {
                    if self.mat[j][i] != actualSerie {
                        winnable = 0
                    }
                }
                if winnable == 1{
                    println("C'est gagné !")
                    return (1,actualSerie)
                }
            }
            
        }
        return (0,"")
        }
    
}