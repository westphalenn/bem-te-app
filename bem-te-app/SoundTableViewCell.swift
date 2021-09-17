//
//  SoundTableViewCell.swift
//  bem-te-app
//
//  Created by Frederico Westphalen Mendes Machado on 17/09/21.
//

import UIKit

class SoundTableViewCell: UITableViewCell {

    
    @IBOutlet weak var soundName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
