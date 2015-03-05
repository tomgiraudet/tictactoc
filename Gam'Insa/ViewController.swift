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

    // Game
    var matrix = Array<Array<Player>>()
    enum stateGame {
        case playing
        case wino
        case winx
        case tie
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
        //Player
        player1 = Player()
        player1.createPlayer("Player", img:"x")
        player2 = Player()
        player2.createPlayer("Player", img:"o")
        currentPlayer = player1
        
        var title = UIImageView(image: UIImage(named: "title.png"))
        title.sizeToFit()
        title.frame = CGRectMake((self.view.frame.size.width-title.frame.size.width)/2, 40, title.frame.size.width, title.frame.size.height)
        self.view.addSubview(title)
        
        let grid = UIImageView(image: UIImage(named: "grid.png"))
        grid.frame.size.width = self.view.frame.size.width
        grid.frame.size.height = self.view.frame.size.width * (704/659)
        grid.frame.origin.y = (((self.view.frame.size.height-(title.frame.size.height + title.frame.origin.y))-grid.frame.size.height)/2) + (title.frame.size.height + title.frame.origin.y)
        
        self.view.addSubview(grid)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

}

