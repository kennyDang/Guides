//
//  Duck.swift
//  Jazzy Example
//
//  Created by Kenny Dang on 2/9/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import Foundation

/**
 This is a duck object.
 ### Usage Example ###

 ````
 let duck = Duck()
 duck.displayCoolMessage(message: "quack")
 ````

 */

struct Duck: SuperCoolProtocol{
    /// The age of the duck
    var age: Int

    func displayCoolMessage(message: String) {
        print("Duck goes: \(message)")
    }
}
