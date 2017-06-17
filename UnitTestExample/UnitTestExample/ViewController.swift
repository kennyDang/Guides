//
//  ViewController.swift
//  UnitTestExample
//
//  Created by Kenny Dang on 6/17/17.
//  Copyright © 2017 frooctus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mathLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let results = add(3, to: 6)
        mathLabel.text = "\(results)"
    }
    
    func add(_ x: Int, to y: Int) -> Int {
        return x + y
    }
}

