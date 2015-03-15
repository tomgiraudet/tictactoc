//
//  TicTacToc.swift
//  Gam'Insa
//
//  Created by Tom Giraudet on 03/03/2015.
//  Copyright (c) 2015 Tom Giraudet. All rights reserved.
//

import UIKit


class TicTacToc: GeneralView {
    
    var parent : ModeView!
    var settingsParent : SettingsView!
    
    var player1:Player!
    var player2:Player!
    var score1: Int = 0
    var score2: Int = 0
    var currentPlayer:Player!
    var matrice:Matrix!
    var matCase = Array<Array<Case>>()
    
    let grid = UIImageView(image: UIImage(named: "Grid.png"))
    let titre = UIImageView(image: UIImage(named: "Titre.png"))
    let gameInfo = UILabel()
    
    let settingsButton = UIButton()
    let resetButton = UIButton()
    
    let settingsButtonImg = UIImage(named: "settings.png")
    let resetButtonImg = UIImage(named: "reset.png")
    
    // Pop up
    /*let backPopUpView = UIView()
    let popUpView = UIView()
    let winLabel = UILabel()
    let tieLabel = UILabel()*/
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Win pop up
        /*popUpView.alpha = 0
        popUpView.sizeToFit()
        popUpView.backgroundColor = .grayColor()
        popUpView.frame.size.width = self.view.frame.width - 40
        popUpView.frame.size.height = self.view.frame.height * (30/100)
        popUpView.frame.origin.x = 20
        popUpView.frame.origin.y = self.view.frame.height/2 - popUpView.frame.height/2
        popUpView.layer.cornerRadius = 10.0;
        
        winLabel.sizeToFit()
        winLabel.text = "Victoire !"
        winLabel.frame.origin.x = 0
        winLabel.frame.origin.y = 0
        winLabel.textColor = .blackColor()
        popUpView.addSubview(winLabel) */
        
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
        grid.frame.size.width = backViewWhite.frame.size.width
        grid.frame.size.height = self.view.frame.size.width * (704/659)
        grid.frame.origin.x = 0
        grid.frame.origin.y = backViewWhite.frame.height-grid.frame.size.height - 10
        //grid.frame.origin.y = (((self.view.frame.size.height-(titre.frame.size.height + titre.frame.origin.y))-grid.frame.size.height)/2) + (titre.frame.size.height + titre.frame.origin.y)
        
        // TopButton
        settingsButton.frame = CGRectMake (5, 20, 25, 25)
        settingsButton.setImage(settingsButtonImg, forState: .Normal)
        settingsButton.addTarget(self, action: "settings", forControlEvents: .TouchUpInside)
        
        resetButton.frame = CGRectMake (self.view.frame.size.width - 30, 20, 25, 23)
        resetButton.setImage(resetButtonImg, forState: .Normal)
        resetButton.addTarget(self, action: "reset", forControlEvents: .TouchUpInside)
        
        // Matrice de Cases
        for column in 0...2 {
            var _case = Case()
            matCase.append(Array(count:3, repeatedValue:_case))
        }
        
        // Initialisation
        matrice = Matrix()
        matrice.createMatrix()
        backViewWhite.addSubview(grid)
        self.view.addSubview(settingsButton)
        self.view.addSubview(resetButton)
        //self.backViewWhite.addSubview(popUpView)
        //popUpView.addSubview(winLabel)
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
                caseToAdd.frame.origin.y = backViewWhite.frame.height-grid.frame.size.height - 10 + (CGFloat(i)*(caseToAdd.frame.height))
                caseToAdd.frame.origin.x = (CGFloat(j)*((caseToAdd.frame.size.width)+5))
                backViewWhite.addSubview(caseToAdd)
                // Penser à ajouter la case à la matrice de cases
                matCase[i][j] = caseToAdd
            }
        }
    }
    
    func caseJouee(_caseJouee: Case){
        // Le corps de la fonction se trouve dans les sous-classes
    }
    
    
    func reset(){
        self.viewDidLoad()
    }
    
    func settings(){
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc = mainStoryboard.instantiateViewControllerWithIdentifier("soloSettings") as SettingsView
        vc.runningGame = self
        vc.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    
    /*func popUpWin(_playerName: String) {
        
        /*var visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Light)) as UIVisualEffectView
        visualEffectView.frame = self.view.bounds
        self.view.addSubview(visualEffectView)
        

       popUpView.animateWithDuration(1.0, animations: {
            self.popUpView.alpha = 1
        })*/
        println("coucou")
        
        
        
        
    }*/
    
    
    func popUpWin(_playerName: String) {
        let alertController = UIAlertController(title: "Victoire de \(_playerName) !", message:
            "\(player1.name) : \(score1) - \(player2.name) : \(score2) ", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Revanche !",
                                                style: UIAlertActionStyle.Default,
                                                handler: {(alert: UIAlertAction!) in self.reset()}))
        self.presentViewController(alertController, animated: true, completion: nil)
        reset()
    }
    
    func popUpTie() {
        let alertController = UIAlertController(title: "Match nul!", message:
            "\(player1.name) : \(score1) - \(player2.name) : \(score2) ", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Revanche !", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
        reset()
    }
    

    
}