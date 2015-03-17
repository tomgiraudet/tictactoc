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
    
    var scoreLabelPlayer2 = UILabel()
    var scoreLabelPlayer1 = UILabel()
    
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
        grid.frame.size.width = backViewWhite.frame.size.width
        grid.frame.size.height = self.view.frame.size.width * (704/659)
        grid.frame.origin.x = 0
        grid.frame.origin.y = backViewWhite.frame.height-grid.frame.size.height - 2
        //grid.frame.origin.y = (((self.view.frame.size.height-(titre.frame.size.height + titre.frame.origin.y))-grid.frame.size.height)/2) + (titre.frame.size.height + titre.frame.origin.y)
        
        //Profil Pic Player 1
        var xoffset = CGFloat(10)
        var imageViewPlayer1 = UIImageView(image: player1.profilPic)
        var spaceInfoPlayer = (backViewWhite.frame.size.height)-(grid.frame.size.height)
        var profilPicSize = min(spaceInfoPlayer-15 , 90)
        imageViewPlayer1.frame = CGRectMake(xoffset, (spaceInfoPlayer-profilPicSize)/2, profilPicSize, profilPicSize)
        imageViewPlayer1.layer.masksToBounds = true
        imageViewPlayer1.layer.cornerRadius = profilPicSize/2
        imageViewPlayer1.layer.borderColor = greyColor.CGColor
        imageViewPlayer1.layer.borderWidth = 2
        
        //var scoreLabelPlayer1 = UILabel()
        //scoreLabelPlayer1.text = "\(player1.score)"
        scoreLabelPlayer1.textAlignment = .Center
        scoreLabelPlayer1.textColor = .whiteColor()
        var sizeScore = CGFloat(30)
        var yScore = imageViewPlayer1.frame.origin.y + profilPicSize * (1/2 + sqrt(2)/4)
        var xScore = imageViewPlayer1.frame.origin.x + profilPicSize*(1/2 + sqrt(2)/4)
        scoreLabelPlayer1.frame = CGRectMake(xScore - sizeScore/3, yScore - sizeScore/3, sizeScore, sizeScore)
        scoreLabelPlayer1.layer.cornerRadius = scoreLabelPlayer1.frame.size.height/2
        scoreLabelPlayer1.backgroundColor = generalColor
        scoreLabelPlayer1.layer.borderColor = greyColor.CGColor
        scoreLabelPlayer1.layer.masksToBounds = true
        scoreLabelPlayer1.layer.borderWidth = 2
        
        //Profil Pic Player 2
        var imageViewPlayer2 = UIImageView(image: player1.profilPic)
        imageViewPlayer2.frame = CGRectMake((backViewWhite.frame.size.width)-profilPicSize-xoffset, (spaceInfoPlayer-profilPicSize)/2, profilPicSize, profilPicSize)
        imageViewPlayer2.layer.masksToBounds = true
        imageViewPlayer2.layer.cornerRadius = profilPicSize/2
        imageViewPlayer2.layer.borderColor = greyColor.CGColor
        imageViewPlayer2.layer.borderWidth = 2
        
        //var scoreLabelPlayer2 = UILabel()
        //scoreLabelPlayer2.text = "\(player2.score)"
        scoreLabelPlayer2.textAlignment = .Center
        scoreLabelPlayer2.textColor = .whiteColor()
        var xScore2 = backViewWhite.frame.size.width - (profilPicSize*(1/2 + sqrt(2)/4))
        scoreLabelPlayer2.frame = CGRectMake(xScore2 - imageViewPlayer1.frame.origin.x - sizeScore/3,yScore - sizeScore/3, sizeScore, sizeScore)
        scoreLabelPlayer2.layer.cornerRadius = scoreLabelPlayer1.frame.size.height/2
        scoreLabelPlayer2.backgroundColor = generalColor
        scoreLabelPlayer2.layer.borderColor = greyColor.CGColor
        scoreLabelPlayer2.layer.masksToBounds = true
        scoreLabelPlayer2.layer.borderWidth = 2
        
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
        backViewWhite.addSubview(imageViewPlayer1)
        backViewWhite.addSubview(scoreLabelPlayer1)
        backViewWhite.addSubview(imageViewPlayer2)
        backViewWhite.addSubview(scoreLabelPlayer2)
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
                caseToAdd.frame.origin.y = backViewWhite.frame.height-grid.frame.size.height - 2 + (CGFloat(i)*(caseToAdd.frame.height))
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
        scoreLabelPlayer1.text = "\(player1.score)"
        scoreLabelPlayer2.text = "\(player2.score)"
        self.viewDidLoad()
        //self.scoreLabelPlayer1.setNeedsDisplay()
        //self.scoreLabelPlayer2.setNeedsDisplay()
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
            "\(player1.name) : \(player1.score) - \(player2.name) : \(player2.score) ", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Revanche !",
                                                style: UIAlertActionStyle.Default,
                                                handler: {(alert: UIAlertAction!) in self.reset()}))
        self.presentViewController(alertController, animated: true, completion: nil)
        reset()
        
    }
    
    func popUpTie() {
        let alertController = UIAlertController(title: "Match nul!", message:
            "\(player1.name) : \(player1.score) - \(player2.name) : \(player2.score) ", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Revanche !", style: UIAlertActionStyle.Default,handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
        reset()
    }
    

    
}