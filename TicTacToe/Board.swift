//
//  Board.swift
//  TicTacToe
//
//  Created by Liuqing Du on 28/05/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import Foundation

class Board {
    var t = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    var played = -1
    var w: BoardViewController? = nil
    
    func setWatch(w: BoardViewController) {
        self.w = w
    }
    
    func getBoard() -> [[Int]] {
        return t
    }
    
    func check() -> Int {
        var i = 0
        var j = 0
        
        // 如果横着连线
        for (i = 0; i < t.count; i++){
            if (t[i][0] == t[i][1] && t[i][0] == t[i][2] && t[i][0] != 0) {
                if (t[i][0] == 1) {
                    return 1
                } else {
                    return -1
                }
            }
        }
        
        // 如果竖着连线
        for (i = 0; i < t.count; i++){
            if (t[0][i] == t[1][i] && t[0][i] == t[2][i] && t[0][i] != 0) {
                if (t[0][i] == 1) {
                    return 1
                } else {
                    return -1
                }
            }
        }
        
        // 如果斜着连线
        if (((t[0][0] == t[1][1] && t[0][0] == t[2][2]) || (t[0][2] == t[1][1] && t[0][2] == t[2][0])) && t[1][1] != 0) {
            if (t[1][1] == 1) {
                return 1
            } else {
                return -1
            }
        }
        
        // 如果还有空白
        for (i = 0; i < t.count; i++) {
            for (j = 0; j <= t[i].count - 1; j++) {
                if (t[i][j] == 0) {
                    return 3;
                }
            }
        }
        
        return 0
    }
    
    func dropPiece(p: PieceLocation) {
        t[p.getX()][p.getY()]=p.getPlayer()
        w!.refresh()
    }
    
}