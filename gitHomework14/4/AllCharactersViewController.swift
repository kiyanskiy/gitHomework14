//
//  AllCharactersViewController.swift
//  gitHomework14
//
//  Created by Oleksandr Kiianskyi on 16.07.2021.
//

import UIKit
import Alamofire

class AllCharactersViewController: UIViewController {
    var characters: [Character] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        CharactersLoader().loadCharacters { characters in
            self.characters = characters
            self.tableView.reloadData()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let currentCharacter = characters[tableView.indexPathForSelectedRow!.row]
        (segue.destination as! CharacterViewController).characterURL = currentCharacter.url
    }


}

extension AllCharactersViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        let character = characters[indexPath.row]
        cell.fillCell(character: character)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return characters.count
    }
   
    
}
