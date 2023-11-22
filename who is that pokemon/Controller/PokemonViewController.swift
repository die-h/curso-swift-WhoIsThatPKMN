//
//  ViewController.swift
//  who is that pokemon
//
//  Created by Alex Camacho on 01/08/22.
//

import UIKit

class PokemonViewController: UIViewController {
    
    @IBOutlet weak var imagePokemon: UIImageView!
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet var buttonAnswer: [UIButton]!
    
    lazy var pokemonManager = PokemonManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButtons()
        pokemonManager.fetchPokemon()
    }
    
    func createButtons(){
        for button in buttonAnswer {
            button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 255, alpha: 0.5).cgColor
            button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            button.layer.shadowOpacity = 1
            button.layer.shadowRadius = 0
            button.layer.masksToBounds = false
            button.layer.cornerRadius = 10
            
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if let buttonName = sender.title(for: .normal) {
            print(buttonName)
        }
    }
}
