//
//  UserCell.swift
//  CursoFirebase
//
//  Created by UNAM-Apple12 on 30/06/22.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var lblUserName: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
