//
//  TableViewCell.swift
//  homework12
//
//  Created by Oleksandr Kiianskyi on 28.06.2021.
//

import UIKit
import Alamofire
class TableViewCell: UITableViewCell {

    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var statusIconView: UIView!
    @IBOutlet weak var lastLocationLabel: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func fillCell(character: Character){
        self.nameLabel.text = character.name
        self.lastLocationLabel.text = character.location.name
        self.statusLabel.text = character.status + " - " + character.species
        self.statusIconView.layer.cornerRadius = 5
        switch character.status {
        case "Dead":
            self.statusIconView.backgroundColor = .red
        case "unknown":
            self.statusIconView.backgroundColor = .orange
        default:
            self.statusIconView.backgroundColor = .green
        }

        AF.request(character.image).response { response in
            if let data = response.data {
                self.characterImageView.image = UIImage(data: data)
            }
        }
    }
}
