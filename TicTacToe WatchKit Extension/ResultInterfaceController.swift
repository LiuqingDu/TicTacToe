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
    
    @IBOutlet weak var resultLabel: WKInterfaceLabel!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        setTitle("再来")
        
        switch (context as! Int) {
        case 0:
            resultLabel.setText("平局")
        case 1:
            resultLabel.setText("恭喜您赢了")
        case -1:
            resultLabel.setText("您输了")
        default:
            resultLabel.setText("")
        }
        
    }
    
    override func dismissController() {
        println("dismiss")
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
