//
//  SoloMode.swift
//  Gam'Insa
//
//  Created by Tom Giraudet on 03/03/2015.
//  Copyright (c) 2015 Tom Giraudet. All rights reserved.
//

import UIKit


class SoloMode: TicTacToc {
    
    var level: Int! // Value between 1 and 3 that gives the level of the game.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Players
        player1 = Player()
        player1.createPlayer("Juliette", img:"X_black.png")
        player2 = Player()
        player2.createPlayer("Dieu", img:"O_black.png")
        currentPlayer = player1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Fonction appelée lorsqu'une case est touchée
    override func caseJouee(_caseJouee: Case){
        // Gestion de l'affichage et du current player
        if (_caseJouee.player == nil){
            _caseJouee.setPlayer(_caseJouee.papa!.currentPlayer)
            _caseJouee.placeCase(_caseJouee.papa!.currentPlayer)
            if (_caseJouee.papa!.currentPlayer == _caseJouee.papa!.player1){
                _caseJouee.papa!.currentPlayer = _caseJouee.papa!.player2
            }else{
                _caseJouee.papa!.currentPlayer = _caseJouee.papa!.player1
            }
            
        }
        println("Coup du tour : \(_caseJouee.player?.name) en [\(_caseJouee.i), \(_caseJouee.j)]")
        
        // Gestion de la matrice
        matrice.addCase(_caseJouee.i, j: _caseJouee.j, _player: _caseJouee.player!)
        println("\(matrice.matrixGagnante())")
        if matrice.matrixGagnante().0 == 1 {
            switch matrice.matrixGagnante().1{
            case player1.name: score1++
            case player2.name: score2++
            default: println("C'est dieu qui a gagné")
            }
            popUpWin(matrice.matrixGagnante().1)
            reset()
        }
        if matrice.matrixGagnante().0 == 2 {
            popUpTie()
            reset()
        }
    }
}
