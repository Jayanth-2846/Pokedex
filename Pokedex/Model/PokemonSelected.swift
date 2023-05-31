//
//  PokemonSelected.swift
//  Pokedex
//
//  Created by Jayanth Ambaldhage on 05/05/23.
//

import Foundation

struct PokemonSelected: Codable {
    var sprites: PokemonSprites
}

struct PokemonSprites: Codable {
    var front_default: String
}

class PokeSelectedApi {
    func getData(url: String,completion: @escaping (PokemonSprites)->()) {
        guard let url = URL(string: url) else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,error == nil else {return}
            let pokemonSprite = try! JSONDecoder().decode(PokemonSelected.self, from: data)
            DispatchQueue.main.async {
                completion(pokemonSprite.sprites)
            }
        }
            task.resume()
    }
}
