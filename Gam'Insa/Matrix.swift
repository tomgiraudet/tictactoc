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
    
    //var mat:Array<Array<Player>>!
    var mat: [[Player]]!
    
    
    func createMatrix(){
        mat = Array<Array<Player>>()
    }
    
    
    func addCase(i: Int, j: Int, _player: Player){
        mat[i][j] = _player
        println("Case ajoutée à la matrice")
    }
    
    
    func matrixGagnante() -> (Int, String){
        
        var winnableTotal: Int = 0
        var winner: String = ""
        
        if (diagonaleGagnante().0 == 1){
            winnableTotal == 1
            winner = diagonaleGagnante().1
            return (winnableTotal,winner)
        }else{
            if (ligneGagnante().0 == 1){
                winnableTotal == 1
                winner = diagonaleGagnante().1
                return (winnableTotal,winner)
            }else{
                if (colonneGagnante().0 == 1){
                    winnableTotal == 1
                    winner = diagonaleGagnante().1
                    return (winnableTotal,winner)
                }else{
                    return (0,"")
                }
            }
        }
    }
    
    
    
    
    func diagonaleGagnante() ->(Int, String){
        var winnable: Int = 1
        var actualSerie: String
        
        // première diagonale
        if (self.mat[0][0].name == ""){
            winnable = 0
           return (winnable,"")
        }else{
            actualSerie = self.mat[0][0].name
            for i in 1...2{
                if !(self.mat[i][i] == actualSerie){
                    winnable = 0
                // La diagonale ne peut plus être valide
                }
            }
            
            if (winnable == 1){
                return (winnable,actualSerie)
                // C'est gagné
            }else{
                
                // seconde diagonale
                if !(self.mat[0][2].name == ""){
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

    
    
    func colonneGagnante() ->(Int,String){
        var winnable: Int = 1
        var actualSerie: String
        for i in 0...2 {
            if !(self.mat[i][0].name == "") {
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
    
    func ligneGagnante() ->(Int,String){
        var winnable: Int = 1
        var actualSerie: String
        for i in 0...2 {
            if !(self.mat[0][i].name == "") {
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