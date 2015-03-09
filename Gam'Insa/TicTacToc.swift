//
//  TicTacToc.swift
//  Gam'Insa
//
//  Created by Tom Giraudet on 03/03/2015.
//  Copyright (c) 2015 Tom Giraudet. All rights reserved.
//

import UIKit


class TicTacToc: UIViewController {
    
    var parent : ModeView!
    var settingsParent : SettingsView!
    
    var player1:Player!
    var player2:Player!
    var score1: Int = 0
    var score2: Int = 0
    var currentPlayer:Player!
    var matrice:Matrix!
    
    let grid = UIImageView(image: UIImage(named: "Grid.png"))
    let titre = UIImageView(image: UIImage(named: "Titre.png"))
    let gameInfo = UILabel()
    let background = UIImageView(image: UIImage(named: "background.png"))
    
    let settingsButton = UIButton()
    let resetButton = UIButton()
    
    let settingsButtonImg = UIImage(named: "settings.png")
    let resetButtonImg = UIImage(named: "reset.png")
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Players
        player1 = Player()
        player1.createPlayer("Juliette", img:"X_black.png")
        player2 = Player()
        player2.createPlayer("Tom", img:"O_black.png")
        currentPlayer = player1

        
        // Titre
        titre.sizeToFit()
        titre.frame = CGRectMake((self.view.frame.size.width-titre.frame.size.width)/2, 20, titre.frame.size.width, titre.frame.size.height)
        
        // Grille
        grid.frame.size.width = self.view.frame.size.width-20
        grid.frame.size.height = self.view.frame.size.width * (704/659)
        grid.frame.origin.x = 10
        grid.frame.origin.y = (((self.view.frame.size.height-(titre.frame.size.height + titre.frame.origin.y))-grid.frame.size.height)/2) + (titre.frame.size.height + titre.frame.origin.y)
        
        // GameInfo
        gameInfo.frame = CGRectMake(10, titre.frame.origin.y+titre.frame.size.height, self.view.frame.width-20, 50)
        gameInfo.text = "\(player1.name) - \(score1) vs \(score2) - \(player2.name)"
        gameInfo.textAlignment = .Center
        gameInfo.textColor = UIColor.blackColor()
        
        // TopButton
        settingsButton.frame = CGRectMake (5, 20, 25, 25)
        settingsButton.setImage(settingsButtonImg, forState: .Normal)
        settingsButton.addTarget(self, action: "settings", forControlEvents: .TouchUpInside)
        
        resetButton.frame = CGRectMake (self.view.frame.size.width - 30, 20, 25, 23)
        resetButton.setImage(resetButtonImg, forState: .Normal)
        resetButton.addTarget(self, action: "reset", forControlEvents: .TouchUpInside)
        
        //Background
        background.frame.size.width = self.view.frame.size.width
        background.frame.size.height = self.view.frame.size.height
        
        // Initialisation
        matrice = Matrix()
        matrice.createMatrix()
        self.view.addSubview(background)
        self.view.addSubview(titre)
        self.view.addSubview(grid)
        //self.view.addSubview(gameInfo)
        self.view.addSubview(settingsButton)
        self.view.addSubview(resetButton)
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
                caseToAdd.initView(i,j: j, _papa: self)
                caseToAdd.frame.size.width = (grid.frame.size.width/3)-2
                caseToAdd.frame.size.height = (grid.frame.size.height/3)-2
                caseToAdd.frame.origin.y = grid.frame.origin.y + (CGFloat(i)*(caseToAdd.frame.height))
                caseToAdd.frame.origin.x = (CGFloat(j)*((caseToAdd.frame.size.width)+10)) + 2
                self.view.addSubview(caseToAdd)
                
            }
        }
    }
    
    func caseJouee(_caseJouee: Case){
        // Le corps de la fonction se trouve dans les sous-classes
    }
    
    
    func reset(){
        viewDidLoad()
    }
    
    func settings(){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc = mainStoryboard.instantiateViewControllerWithIdentifier("soloSettings") as SettingsView
        vc.runningGame = self
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    func popUpWin(_playerName: String) {
        let alertController = UIAlertController(title: "Victoire de \(_playerName) !", message:
            "\(player1.name) : \(score1) - \(player2.name) : \(score2) ", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Revanche !", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func popUpTie() {
        let alertController = UIAlertController(title: "Match nul!", message:
            "\(player1.name) : \(score1) - \(player2.name) : \(score2) ", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Revanche !", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
}