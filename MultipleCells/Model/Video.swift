//
//  Video.swift
//  MultipleCells
//
//  Created by Giuseppe Sapienza on 13/05/2019.
//  Copyright © 2019 Giuseppe Sapienza. All rights reserved.
//

import UIKit

struct Video {
    let thumbnail: UIImage
    let title: String
    let date: String
    let lastComment: Comment?
}

struct Comment {
    let text: String
    let authorImage: UIImage
}
