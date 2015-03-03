//
//  ViewController.swift
//  Gam'Insa
//
//  Created by Tom Giraudet on 03/03/2015.
//  Copyright (c) 2015 Tom Giraudet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentPlayer: Player
    
    enum CompassPoint {
        case playing
        case wino
        case winx
        case tie
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

