//
//  ResultInterfaceController.swift
//  TicTacToe
//
//  Created by Liuqing Du on 06/05/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import WatchKit
import Foundation


class ResultInterfaceController: WKInterfaceController {
    
    var play_again = NSLocalizedString("PLAY_AGAIN", comment: "Play again")
    var end_tittle = NSLocalizedString("END_TITTLE", comment: "Game End")
    var draw = NSLocalizedString("DRAW", comment: "Draw")
    var win = NSLocalizedString("WIN", comment: "Win")
    var lose = NSLocalizedString("LOSE", comment: "Lose")
    
    @IBOutlet weak var resultLabel: WKInterfaceLabel!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        setTitle(play_again)
        
        switch (context as! Int) {
        case 0:
            resultLabel.setText(draw)
        case 1:
            resultLabel.setText(win)
        case -1:
            resultLabel.setText(lose)
        default:
            resultLabel.setText("")
        }
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
