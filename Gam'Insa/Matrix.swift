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
    
    var mat:Array<Array<Player>>!
    
    func createMatrix(){
        self.mat = Array<Array<Player>>()
    }
    
    // Regarde s'il y a une diagonale qui a gagné
    //func diagonaleGagnante() -> (Int,String){
        
        
       //     }
    
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