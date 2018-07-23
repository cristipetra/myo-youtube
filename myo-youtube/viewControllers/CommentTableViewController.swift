//
//  CommentTableViewController.swift
//  myo-youtube
//
//  Created by Cristian Petra on 23/07/2018.
//  Copyright © 2018 artep. All rights reserved.
//

import UIKit

class CommentTableViewController: UITableViewController {
    
    var comments: [CommentItem] = []
    private var videoId: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = nil
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getComments()
    }
    
    private func getComments() {
        guard let videoId = videoId else { return }
        
        YoutubeApi().getComments(videoId) { (commentsList) in
            self.comments = (commentsList?.items)!
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: YoutubeCommentViewCell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! YoutubeCommentViewCell
        cell.configure(comments[indexPath.row])
        return cell
    }
    
    internal func configure(_ videoId: String) {
        self.videoId = videoId
    }
}
