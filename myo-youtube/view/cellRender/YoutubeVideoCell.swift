//
//  YoutubeVideoCell.swift
//  myo-youtube
//
//  Created by Cristian Petra on 21/07/2018.
//  Copyright © 2018 artep. All rights reserved.
//

import UIKit
import SDWebImage

protocol YoutubeVideoProtocol {
    func configure(_ video: YoutubeVideo)
}

class YoutubeVideoCell: UITableViewCell {

    @IBOutlet weak var videoImageView: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension YoutubeVideoCell: YoutubeVideoProtocol {
    func configure(_ video: YoutubeVideo) {
        title.text = video.snippet.title
        videoImageView.sd_setImage(with: video.snippet.thumbnails.defaultThumbnail.url, completed: nil)
    }
}
