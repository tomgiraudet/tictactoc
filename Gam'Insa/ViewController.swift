//
//  ViewController.swift
//  Gam'Insa
//
//  Created by Tom Giraudet on 03/03/2015.
//  Copyright (c) 2015 Tom Giraudet. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    
    var player1:Player!
    var player2:Player!
    var currentPlayer:Player!
    //var matrix = Array<Array<Player>>()
    enum stateGame {
        case playing
        case wino
        case winx
        case tie
    }
    
    let grid = UIImageView(image: UIImage(named: "grid.png"))
    let titre = UIImageView(image: UIImage(named: "Titre.png"))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        //Player
        player1 = Player()
        player1.createPlayer("Player", img:"x.png")
        player2 = Player()
        player2.createPlayer("Player", img:"o.png")
        currentPlayer = player1
        
        // Placement titre
        titre.sizeToFit()
        titre.frame = CGRectMake((self.view.frame.size.width-titre.frame.size.width)/2, 40, titre.frame.size.width, titre.frame.size.height)
        
        // Placement grille
        grid.frame.size.width = self.view.frame.size.width-20
        grid.frame.size.height = self.view.frame.size.width * (704/659)
        grid.frame.origin.x = 10
        grid.frame.origin.y = (((self.view.frame.size.height-(titre.frame.size.height + titre.frame.origin.y))-grid.frame.size.height)/2) + (titre.frame.size.height + titre.frame.origin.y)
        
        // Initialisation
        var background = UIImageView(image: UIImage(named: "background.png"))
        background.frame.size.width = self.view.frame.size.width
        background.frame.size.height = self.view.frame.size.height
        self.view.addSubview(background)

        self.view.addSubview(titre)
        self.view.addSubview(grid)
        initCases()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initCases(){
        var i,j: Int
        for i in 0...2 {
            for j in 0...2 {
                var caseToAdd = Case()
                caseToAdd.initView(i,j: j)
                
                // Manoucherie
                var x = 15 + CGFloat(i)*((grid.frame.size.width)/6)
                var y = grid.frame.origin.y - (grid.frame.size.height)/4 + CGFloat(j)*((self.view.frame.size.height)/10) + 10
                //var y = grid.frame.origin.y + CGFloat(j)*((self.view.frame.size.height)/6)
                
                var width = (grid.frame.size.width)/5
                var height = (grid.frame.size.height)/5
                caseToAdd.frame = CGRectMake(x, y, width, height)

                caseToAdd.placeCase(player1)
                self.view.addSubview(caseToAdd)
            }
        }
    }
}
