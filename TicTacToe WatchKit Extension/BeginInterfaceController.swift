//
//  BeginInterfaceController.swift
//  TicTacToe
//
//  Created by Liuqing Du on 06/05/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import WatchKit
import Foundation


class BeginInterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        var first = true
        //println(segueIdentifier)
        if (segueIdentifier == "firstMoveSegue") {
            first = true
        } else if (segueIdentifier == "secondMoveSegue") {
            first = false
        }
        return first
    }

}
