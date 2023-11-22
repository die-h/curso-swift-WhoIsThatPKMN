//
//  PokemonData.swift
//  who is that pokemon
//
//  Created by Diego H on 20/11/2023.
//

import Foundation

struct PokemonData : Codable {
    let results : [Result]?
}

struct Result : Codable {
    let name : String?
    let url : String?
}
