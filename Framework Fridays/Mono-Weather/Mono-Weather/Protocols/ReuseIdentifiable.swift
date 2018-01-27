//
//  ReuseIdentifier.swift
//  Mono-Weather
//
//  Created by Kenny Dang on 1/26/18.
//  Copyright © 2018 frooctus. All rights reserved.
//

protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
