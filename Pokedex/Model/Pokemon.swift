//
//  Pokemon.swift
//  Pokedex
//
//  Created by Jayanth Ambaldhage on 04/05/23.
//

import Foundation

struct Pokemon: Codable {
    var results: [PokemonEntries]
}
struct PokemonEntries: Codable {
    var name: String
    var url: String
}

class PokeAPI {
    func getData(completion: @escaping ([PokemonEntries])->()) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=151") else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,error == nil else {return}
            let pokemonList = try! JSONDecoder().decode(Pokemon.self, from: data)
            DispatchQueue.main.async {
                completion(pokemonList.results)
            }
        }
            task.resume()
    }
}
