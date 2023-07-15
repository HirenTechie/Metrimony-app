//
//  ProfileTableViewCell.swift
//  Metrimony
//
//  Created by Hiren Lakhatariya on 18/11/22.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profileimage: UIImageView!
    @IBOutlet weak var profilename: UILabel!
    
    @IBOutlet weak var height_Age: UILabel!
    
    @IBOutlet weak var cast_address: UILabel!
    
    @IBOutlet weak var favourite: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
