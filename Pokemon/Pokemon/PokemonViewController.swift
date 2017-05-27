//
//  PokemonViewController.swift
//  Pokemon
//
//  Created by Kenny Dang on 5/26/17.
//  Copyright © 2017 frooctus LLC. All rights reserved.
//

import UIKit

class PokemonViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var pokemonSearchBar: UISearchBar!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonIDLabel: UILabel!
    @IBOutlet weak var pokemonAbilitiesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonSearchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let pokemonName = searchBar.text else {
            print("Must enter a pokemon name!")
            return
        }
        
        NetworkController.shared.fetchPokemonWith(name: pokemonName) { (pokemon) in
            guard let pokemon = pokemon else {
                return
            }
            
            DispatchQueue.main.async {
                self.pokemonNameLabel.text = pokemon.name
                self.pokemonIDLabel.text = "\(pokemon.id)"
                self.pokemonAbilitiesTextView.text = pokemon.abilities.joined(separator: ", ")
            }
        }
    }
}
