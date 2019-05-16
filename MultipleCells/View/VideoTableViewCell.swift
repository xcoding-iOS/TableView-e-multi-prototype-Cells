//
//  BigPostTableViewCell.swift
//  MultipleCells
//
//  Created by Giuseppe Sapienza on 13/05/2019.
//  Copyright © 2019 Giuseppe Sapienza. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var commentStack: UIStackView!
    @IBOutlet weak var commentInfoLabel: UILabel!
    @IBOutlet weak var commentAuthorImageView: UIImageView!
    @IBOutlet weak var commentTextLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.thumbnailImageView.layer.cornerRadius = 8
        self.commentAuthorImageView.layer.cornerRadius = self.commentAuthorImageView.frame.width/2
        
    }


}
