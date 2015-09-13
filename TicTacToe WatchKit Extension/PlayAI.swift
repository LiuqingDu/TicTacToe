//
//  PlayAI.swift
//  watchGamble
//
//  Created by Liuqing Du on 06/05/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import Foundation

class PlayAI {
    var b = Board()
    var t = [[Int]]()
    
//    init () {
//        
//    }
    
//    init (b: Board) {
//        self.b = b
//        t = b.getBoard()
//    }
    
    func getBoard() -> Board {
        return b
    }
    
    func start() {
        t = b.getBoard()
        if (attack()) {
            
        } else if (defend()){
            
        } else if (center()){
        
        } else {
            planB()
        }
        
    }
    
    func attack() -> Bool {
        return twoPieces(-1)
        
    }
    
    func defend() -> Bool {
        return twoPieces(1)
        
    }
    
    func twoPieces(f: Int) -> Bool {
        for(var i = 0; i < t.count; i++) {
            if(t[i][0] == t[i][1] && t[i][0] == f && t[i][2] == 0){
                b.dropPiece(PieceLocation(p: -1, x: i, y: 2))
                return true
            } else if (t[i][0] == t[i][2] && t[i][0] == f && t[i][1] == 0){
                b.dropPiece(PieceLocation(p: -1, x: i, y: 1))
                return true
            } else if (t[i][1] == t[i][2] && t[i][1] == f && t[i][0] == 0){
                b.dropPiece(PieceLocation(p: -1, x: i, y: 0))
                return true
            } else if (t[0][i] == t[1][i] && t[0][i] == f && t[2][i] == 0){
                b.dropPiece(PieceLocation(p: -1, x: 2, y: i))
                return true
            } else if (t[0][i] == t[2][i] && t[0][i] == f && t[1][i] == 0){
                b.dropPiece(PieceLocation(p: -1, x: 1, y: i))
                return true
            } else if (t[1][i] == t[2][i] && t[1][i] == f && t[0][i] == 0){
                b.dropPiece(PieceLocation(p: -1, x: 0, y: i))
                return true
            }
        }
        
        if (t[0][0] == t[1][1] && t[0][0] == f && t[2][2]==0){
            b.dropPiece(PieceLocation(p: -1, x: 2, y: 2))
            return true
        } else if (t[1][1] == t[2][2] && t[1][1] == f && t[0][0]==0){
            b.dropPiece(PieceLocation(p: -1, x: 0, y: 0))
            return true
        } else if (t[0][2] == t[1][1] && t[0][2] == f && t[2][0]==0){
            b.dropPiece(PieceLocation(p: -1, x: 2, y: 0))
            return true
        } else if (t[1][1] == t[2][0] && t[1][1] == f && t[0][2]==0){
            b.dropPiece(PieceLocation(p: -1, x: 0, y: 2))
            return true
        }
        
        return false
        
    }
    
    func center() -> Bool {
        if (t[1][1] == 0) {
            b.dropPiece(PieceLocation(p: -1, x: 1, y: 1))
            return true
        } else {
            return false
        }
    }
    
    func planB() {
        if(t[0][0] == t[2][2] && t[0][0] == 1 || t[0][2] == t[2][0] && t[0][2] == 1){
            if(t[0][2] == 0){
                b.dropPiece(PieceLocation(p: -1, x: 0, y: 2));
            }else{
                b.dropPiece(PieceLocation(p: -1, x: 0, y: 0));
            }
        } else if((t[0][1] == 1 || t[1][2] == 1) && t[2][0] == 0){
            b.dropPiece(PieceLocation(p: -1, x: 2, y: 0));
        } else if((t[1][0] == 1 || t[2][1] == 1) && t[0][2] == 0){
            b.dropPiece(PieceLocation(p: -1, x: 0, y: 2));
            
        } else if (t[0][0] == 0){
            b.dropPiece(PieceLocation(p: -1, x: 0, y: 0));
        } else if (t[0][2] == 0){
            b.dropPiece(PieceLocation(p: -1, x: 0, y: 2));
        } else if (t[2][0] == 0){
            b.dropPiece(PieceLocation(p: -1, x: 2, y: 0));
        } else if (t[2][2] == 0){
            b.dropPiece(PieceLocation(p: -1, x: 2, y: 2));
        } else if (t[0][1] == 0){
            b.dropPiece(PieceLocation(p: -1, x: 0, y: 1));
        } else if (t[1][0] == 0){
            b.dropPiece(PieceLocation(p: -1, x: 1, y: 0));
        } else if (t[1][2] == 0){
            b.dropPiece(PieceLocation(p: -1, x: 1, y: 2));
        } else {
            b.dropPiece(PieceLocation(p: -1, x: 2, y: 1))
        }
    }
    
}