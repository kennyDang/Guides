//
//  NetworkController.swift
//  Pokemon
//
//  Created by Kenny Dang on 5/26/17.
//  Copyright © 2017 frooctus LLC. All rights reserved.
//

import Foundation

class NetworkController {
    
    static let shared = NetworkController()
    
    func fetchPokemonWith(name: String, completion: @escaping (Pokemon?) -> Void) {
        let urlString = "http://pokeapi.co/api/v2/pokemon/"
        
        guard let baseURL = URL(string: urlString) else {
            print("Could not create baseURL from string")
            return
        }
        
        let searchURL = baseURL.appendingPathComponent(name.lowercased())
        
        URLSession.shared.dataTask(with: searchURL) { (data, _, error) in
            
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("Error parsing data")
                completion(nil)
                return
            }
            
            guard let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any] else {
                print("Error parsing jsonDictionary")
                completion(nil)
                return
            }
            
            let pokemon = Pokemon(jsonDictionary: jsonDictionary)
            
            completion(pokemon)
            
        }.resume()
        
    }
    
}
