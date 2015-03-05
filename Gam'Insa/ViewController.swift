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
    let titre = UIImageView(image: UIImage(named: "title.png"))
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        //Player
        player1 = Player()
        player1.createPlayer("Player", img:"x")
        player2 = Player()
        player2.createPlayer("Player", img:"o")
        currentPlayer = player1
        
        // Placement titre

        titre.sizeToFit()
        titre.frame = CGRectMake((self.view.frame.size.width-titre.frame.size.width)/2, 40, titre.frame.size.width, titre.frame.size.height)
        self.view.addSubview(titre)
        
        // Placement grille
        grid.frame.size.width = self.view.frame.size.width
        grid.frame.size.height = self.view.frame.size.width * (704/659)
        grid.frame.origin.y = (((self.view.frame.size.height-(titre.frame.size.height + titre.frame.origin.y))-grid.frame.size.height)/2) + (titre.frame.size.height + titre.frame.origin.y)
        self.view.addSubview(grid)
        
        // Placement cases
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initCases(){
        var i = 0
        var j = 0
        for(i ; i<3; i++){
            for(j; j<3; j++){
                var caseToAdd = Case()
                caseToAdd.initView(i,j: j)
                var x = 20 + CGFloat(i)*((self.view.frame.size.width)/3)
                var y = grid.frame.origin.y + 20 + CGFloat(j)*((self.view.frame.size.height)/3)
                var width = (grid.frame.size.width)/4
                var height = (grid.frame.size.height)/4
                caseToAdd.frame = CGRectMake(x, y, width, height)
                self.view.addSubview(caseToAdd)
            }
        }
    }
}
