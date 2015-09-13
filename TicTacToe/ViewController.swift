//
//  ViewController.swift
//  TicTacToe
//
//  Created by Liuqing Du on 06/05/2015.
//  Copyright (c) 2015 JuneDesign. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstBtn: UIButton!
    @IBOutlet weak var secondBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let s = segue.identifier
        let d = segue.destinationViewController as! BoardViewController
        if (s == "segueFirst") {
            d.isFirst = true
        } else if (s == "segueSecond") {
            d.isFirst = false
        }
        d.d = self
    }
    
}

