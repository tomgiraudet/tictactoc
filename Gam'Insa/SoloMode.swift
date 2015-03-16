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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Fonction appelée lorsqu'une case est touchée
    override func caseJouee(_caseJouee: Case){
        // Gestion de l'affichage
        if (_caseJouee.player == nil){
            _caseJouee.setPlayer(_caseJouee.papa!.player1)
            _caseJouee.placeCase(_caseJouee.papa!.player1)
        }
        // Gestion de la matrice
        matrice.addCase(_caseJouee.i, j: _caseJouee.j, _player: player1)
        if matrice.matrixGagnante().0 == 1 {
            switch matrice.matrixGagnante().1{
            case player1.name: score1++
            case player2.name: score2++
            default: println("C'est dieu qui a gagné")
            }
            popUpWin(matrice.matrixGagnante().1)
            reset()
        }else{
            if matrice.matrixGagnante().0 == 2 {
                popUpTie()
                reset()
            }else{
                println("Fin du coup du joueur réel")
                // Fin du coup du joueur, au tour de l'IA de jouer
                let delay = 0.4 * Double(NSEC_PER_SEC)
                let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
                dispatch_after(time, dispatch_get_main_queue()){
                    self.timeToMakeGodPlayTicTacToc()
                }
            }
        }
    }


    func timeToMakeGodPlayTicTacToc() {
        // Définition de la case à jouer :
        var whereToPlay: (iToPlay: Int,jToPlay: Int)
        whereToPlay = (-1,-1)
        switch self.level {
        case 1: whereToPlay = matrice.easyGame(matCase)
        case 2: whereToPlay = matrice.mediumGame()
        case 3: whereToPlay = matrice.hardGame()
        default: println("C'est encore un coup de dieu ...")
        }
        
        var _caseJoueeParIA = self.matCase[whereToPlay.0][whereToPlay.1]
        // Gestion de l'affichage
        _caseJoueeParIA.setPlayer(_caseJoueeParIA.papa!.player2)
        _caseJoueeParIA.placeCase(_caseJoueeParIA.papa!.player2)
        
        // Gestion de la matrice
        matrice.addCase(whereToPlay.0,j: whereToPlay.1,_player: player2)
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
        println("Fin du tour de l'IA")
    } // Fin fonction
    
}



