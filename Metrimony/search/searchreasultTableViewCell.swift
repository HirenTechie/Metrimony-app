//
//  searchreasultTableViewCell.swift
//  Metrimony
//
//  Created by Hiren Lakhatariya on 23/11/22.
//

import UIKit

class searchreasultTableViewCell: UITableViewCell {

    @IBOutlet weak var s_image: UIImageView!
    
    @IBOutlet weak var s_name: UILabel!
    
    @IBOutlet weak var s_age_address: UILabel!
    
    @IBOutlet weak var s_cast_address: UILabel!
    
    
    @IBOutlet weak var heart: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
