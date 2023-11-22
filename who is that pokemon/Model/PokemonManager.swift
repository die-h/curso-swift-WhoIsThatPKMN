//
//  PokemonManager.swift
//  who is that pokemon
//
//  Created by Diego H on 20/11/2023.
//

import Foundation

struct PokemonManager {
    
    let pokemonUrl : String = "https://pokeapi.co/api/v2/pokemon?limit=1017"
    
    func performRequest(with urlString : String) {
        
        // Create/Get an url
        if let url = URL(string : urlString) {
            // Create an URL session
            let session = URLSession(configuration: .default)
            
            // Give the session a task
            let task = session.dataTask(with: url) {data , response, error in
                if error != nil {
                    print(error!)
                }
                
                if let safeData = data {
                    if let pokemon = self.parseJSON(pokemonData : safeData) {
                        print(pokemon)
                    }
                }
                
            }
            
            // Start the task
            task.resume()
        }
    }
    
    func parseJSON(pokemonData: Data) -> [PokemonModel]? {
        let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(PokemonData.self, from: pokemonData)
                let pokemon = decodedData.result?.map{
                    PokemonModel(name: $0.name ?? "", imageUrl: $0.url ?? "")
                }
                
                return pokemon
            } catch {
                return nil
            }
        }

