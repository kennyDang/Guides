//
//  Pokemon.swift
//  Pokemon
//
//  Created by Kenny Dang on 5/26/17.
//  Copyright © 2017 frooctus LLC. All rights reserved.
//

class Pokemon {
    var name: String
    var id: Int
    var abilities: [String]
    
    init?(jsonDictionary: [String: Any]) {
        guard let name = jsonDictionary["name"] as? String,
            let id = jsonDictionary["id"] as? Int,
            let abilities = jsonDictionary["abilities"] as? [[String: Any]] else {
                return nil
        }
        
        var abilityNames: [String] = []
        
        for abilityDictionary in abilities {
            
            guard let ability = abilityDictionary["ability"] as? [String: Any], let name = ability["name"] as? String else { break }
            
            abilityNames.append(name)
        }
        
        self.name = name
        self.id = id
        self.abilities = abilityNames
    }
}
