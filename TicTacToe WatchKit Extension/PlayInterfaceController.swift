//
//  InterfaceController.swift
//  watchGamble WatchKit Extension
//
//  Created by Liuqing Du on 05/05/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import WatchKit
import Foundation

class PlayInterfaceController: WKInterfaceController {
    //    var playBoard = Board()
    var playAI: PlayAI!
    var flag: Int!
    var first = true
    var s = [["", "", ""], ["", "", ""], ["", "", ""]]
    
    @IBOutlet weak var button00: WKInterfaceButton!
    @IBOutlet weak var button01: WKInterfaceButton!
    @IBOutlet weak var button02: WKInterfaceButton!
    @IBOutlet weak var button10: WKInterfaceButton!
    @IBOutlet weak var button11: WKInterfaceButton!
    @IBOutlet weak var button12: WKInterfaceButton!
    @IBOutlet weak var button20: WKInterfaceButton!
    @IBOutlet weak var button21: WKInterfaceButton!
    @IBOutlet weak var button22: WKInterfaceButton!
    
    @IBAction func move00() {
        move(0, y: 0)
    }
    
    @IBAction func move01() {
        move(0, y: 1)
    }
    
    @IBAction func move02() {
        move(0, y: 2)
    }
    
    @IBAction func move10() {
        move(1, y: 0)
    }
    
    @IBAction func move11() {
        move(1, y: 1)
    }
    
    @IBAction func move12() {
        move(1, y: 2)
    }
    
    @IBAction func move20() {
        move(2, y: 0)
    }
    
    @IBAction func move21() {
        move(2, y: 1)
    }
    
    @IBAction func move22() {
        move(2, y: 2)
    }
    
    func refresh() {
        for (var i = 0; i < playAI.getBoard().getBoard().count; i++) {
            for (var j = 0; j < playAI.getBoard().getBoard()[i].count; j++) {
                if (playAI.getBoard().getBoard()[i][j] == -1) {
                    s[i][j] = "X"
                } else if (playAI.getBoard().getBoard()[i][j] == 0) {
                    s[i][j] = ""
                } else {
                    s[i][j] = "O"
                }
            }
        }
        button00.setTitle(s[0][0])
        button01.setTitle(s[0][1])
        button02.setTitle(s[0][2])
        button10.setTitle(s[1][0])
        button11.setTitle(s[1][1])
        button12.setTitle(s[1][2])
        button20.setTitle(s[2][0])
        button21.setTitle(s[2][1])
        button22.setTitle(s[2][2])
    }
    
    
    func move(x: Int, y: Int) {
        //println(playAI.getBoard().getBoard())
        
        if (playAI.getBoard().getBoard()[x][y] == 0) {
            
            playAI.getBoard().dropPiece(PieceLocation(p: flag, x: x, y: y))
            aiMove()
            
            if (playAI.getBoard().check() == 1) {
                println("Player Win")
                result(1)
                flag = 2
            } else if (playAI.getBoard().check() == -1) {
                println("AI Win")
                result(-1)
                flag = 2
            } else if (playAI.getBoard().check() == 3) {
                println("Nice Move")
            } else {
                println("Draw")
                result(0)
                flag = 2
            }
        }
        
    }
    
    func result(result: Int) {
        presentControllerWithName("resultView", context: result)
    }
    
    func aiMove() {
        flag = -flag!
        playAI.start()
        flag = -flag!
        
    }
    
    func reset() {
        self.flag = 1
        playAI = PlayAI()
        playAI.getBoard().setWatch(self)
        
        if (!first) {
            aiMove()
        }
        
        refresh()
    }
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        first = context as! Bool
        
        reset()
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        
        reset()
        
        super.willActivate()
        
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
    }
    
}
