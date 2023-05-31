//
//  ViewController.swift
//  Pokedex
//
//  Created by Jayanth Ambaldhage on 01/05/23.
//

import UIKit

class HomeViewController: UITableViewController {
    
//    let pokeArray = ["Pikachu","Balbasaur","Chicken"]
    var pokemon = [PokemonEntries]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        PokeAPI().getData() {result in self.pokemon = result
            self.tableView.reloadData()
        
        }
    }
    //MARK: - TableView Data source Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeItemCell", for: indexPath)
        cell.textLabel?.text = pokemon[indexPath.row].name
        return cell
    }

}

