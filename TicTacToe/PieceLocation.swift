//
//  PieceLocation.swift
//  TicTacToe
//
//  Created by Liuqing Du on 28/05/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import Foundation

class PieceLocation {
    var player = -1
    var x = 0
    var y = 0
    
    init(p: Int, x: Int, y: Int) {
        self.player = p
        self.x = x
        self.y = y
    }
    
    func getX() -> Int {
        return x;
    }
    
    func getY() -> Int {
        return y;
    }
    
    func getPlayer() -> Int {
        return player;
    }
    
}