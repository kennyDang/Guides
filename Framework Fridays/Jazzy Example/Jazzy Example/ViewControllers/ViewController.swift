//
//  ViewController.swift
//  Jazzy Example
//
//  Created by Kenny Dang on 2/9/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let duck = Duck(age: 3)
        duck.displayCoolMessage(message: "quack quack")
    }

}

