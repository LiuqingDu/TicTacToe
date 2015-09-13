//
//  BoardViewController.swift
//  TicTacToe
//
//  Created by Liuqing Du on 28/05/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController {
    
    var isFirst: Bool!
    var playAI: PlayAI!
    var flag: Int!
    var s = [["", "", ""], ["", "", ""], ["", "", ""]]
    var d: ViewController!
    
    @IBOutlet weak var btn00: UIButton!
    @IBOutlet weak var btn01: UIButton!
    @IBOutlet weak var btn02: UIButton!
    @IBOutlet weak var btn10: UIButton!
    @IBOutlet weak var btn11: UIButton!
    @IBOutlet weak var btn12: UIButton!
    @IBOutlet weak var btn20: UIButton!
    @IBOutlet weak var btn21: UIButton!
    @IBOutlet weak var btn22: UIButton!
    
    @IBAction func backBtn(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
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
        btn00.setTitle(s[0][0], forState: [])
        btn01.setTitle(s[0][1], forState: [])
        btn02.setTitle(s[0][2], forState: [])
        btn10.setTitle(s[1][0], forState: [])
        btn11.setTitle(s[1][1], forState: [])
        btn12.setTitle(s[1][2], forState: [])
        btn20.setTitle(s[2][0], forState: [])
        btn21.setTitle(s[2][1], forState: [])
        btn22.setTitle(s[2][2], forState: [])
        
        if (playAI.getBoard().check() == 1) {
            //println("Player Win")
            result(1)
        } else if (playAI.getBoard().check() == -1) {
            //println("AI Win")
            result(-1)
        } else if (playAI.getBoard().check() == 3) {
            //println("Nice Move")
            if (flag == -1) {
                aiMove()
            }
        } else if (playAI.getBoard().check() == 0){
            //println("Draw")
            result(0)
        }
    }
    
    
    func move(x: Int, y: Int) {
        
        if (playAI.getBoard().getBoard()[x][y] == 0 && flag == 1) {
            flag = -flag!
            
            playAI.getBoard().dropPiece(PieceLocation(p: 1, x: x, y: y))
            
        }
        
    }
    
//    func checkIfEnd() -> Bool{
//        if (playAI.getBoard().check() == 1) {
//            result(1)
//            return true
//        } else if (playAI.getBoard().check() == -1) {
//            result(-1)
//            return true
//        } else if (playAI.getBoard().check() == 0) {
//            result(0)
//            return true
//        }
//        return false
//    }
    
    func result(result: Int) {
        var alertView: UIAlertController!
        let play_again = NSLocalizedString("PLAY_AGAIN", comment: "Play again")
        let end_tittle = NSLocalizedString("END_TITTLE", comment: "Game End")
        let draw = NSLocalizedString("DRAW", comment: "Draw")
        let win = NSLocalizedString("WIN", comment: "Win")
        let lose = NSLocalizedString("LOSE", comment: "Lose")
        
        let alertAction = UIAlertAction(title: play_again, style: UIAlertActionStyle.Default, handler: { (_) -> Void in
            self.reset()
        })
        alertView = UIAlertController(title: end_tittle, message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        alertView.addAction(alertAction)
        
        switch (result) {
        case 0:
            alertView.message = draw
        case 1:
            alertView.message = win
        case -1:
            alertView.message = lose
        default:
            print("")
        }
        presentViewController(alertView, animated: true, completion: nil)
        flag = 2
    }
    
    func aiMove() {
        if (flag == -1) {
            flag = -flag!
            playAI.start()
        }
    }
    
    func reset() {
        flag = 1
        playAI = PlayAI()
        playAI.getBoard().setWatch(self)
        
        if (!isFirst) {
            flag = -flag!
            aiMove()
        }
        
        refresh()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        reset()
    }
    
    override func viewWillAppear(animated: Bool) {
        reset()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
