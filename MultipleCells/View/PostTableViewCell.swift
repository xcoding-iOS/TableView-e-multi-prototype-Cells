//
//  LittlePostTableViewCell.swift
//  MultipleCells
//
//  Created by Giuseppe Sapienza on 13/05/2019.
//  Copyright © 2019 Giuseppe Sapienza. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    @IBOutlet weak var titlePostLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.postImageView.layer.cornerRadius = 8
    }

}
