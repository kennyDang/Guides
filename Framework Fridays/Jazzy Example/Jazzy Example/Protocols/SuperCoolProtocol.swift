//
//  SuperCoolProtocol.swift
//  Jazzy Example
//
//  Created by Kenny Dang on 2/9/18.
//  Copyright © 2018 Kenny Dang. All rights reserved.
//

import Foundation

/**
 # Super Cool Protocol Info #

 Objects that conforms to this protocol must display
 a cool message.

 */
protocol SuperCoolProtocol {
    /**
        Displays a message

     - parameter message: The message to be displayed.
    */
    func displayCoolMessage(message: String)
}
