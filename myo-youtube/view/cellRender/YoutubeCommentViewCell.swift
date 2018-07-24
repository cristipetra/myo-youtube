//
//  YoutubeCommentViewCell.swift
//  myo-youtube
//
//  Created by Cristian Petra on 23/07/2018.
//  Copyright © 2018 artep. All rights reserved.
//

import UIKit

protocol CommentCellProtocol {
    func configure(_ item: CommentItem)
}

class YoutubeCommentViewCell: UITableViewCell {

    @IBOutlet weak var commentLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension YoutubeCommentViewCell: CommentCellProtocol {
    internal func configure(_ item: CommentItem) {
        commentLbl.text = item.snippet.topLevelComment.snippet.textDisplay
    }
}
