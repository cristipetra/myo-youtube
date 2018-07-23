//
//  YoutubeDetailsViewController.swift
//  myo-youtube
//
//  Created by Cristian Petra on 23/07/2018.
//  Copyright © 2018 artep. All rights reserved.
//

import UIKit
import YouTubePlayer

class YoutubeDetailsViewController: UIViewController {
    
    @IBOutlet weak var videoTitle: UILabel!
    @IBOutlet weak var containerVideoPlayer: UIView!
    @IBOutlet weak var containerComments: UIView!
    
    var commentsTableViewController: CommentTableViewController!
    
    private var youtubeVideo: YoutubeVideo?
    
    private var videoPlayer: YouTubePlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createVideoPlayer()
        addCommentsView()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "Back", style: .done, target: self, action: #selector(handlerCloseWindow))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateView()
        
        if let youtubeVideo = youtubeVideo {
            if let videoId = youtubeVideo.id.videoId {
                commentsTableViewController.configure(videoId)
            }
            
        }
    }
    
    private func addCommentsView() {
        commentsTableViewController = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "commentsTableViewController") as! CommentTableViewController
        
        addChildViewController(commentsTableViewController)
        self.containerComments.addSubview(commentsTableViewController.view)
        commentsTableViewController.view.frame = self.containerComments.bounds
        
        
        
        commentsTableViewController.didMove(toParentViewController: self)
    }
    
    private func createVideoPlayer() {
        videoPlayer = YouTubePlayerView(frame: containerVideoPlayer.frame)
        containerVideoPlayer.addSubview(videoPlayer)
    }
    
    @objc internal func handlerCloseWindow() {
        self.dismiss(animated: true, completion: nil)
    }
    
    internal func configure(_ video: YoutubeVideo) {
        youtubeVideo = video
    }
    
    private func updateView() {
        self.title = ""
        if let video = youtubeVideo {
            videoTitle.text = video.snippet.title
            if let videoId = video.id.videoId {
                videoPlayer.loadVideoID(videoId)
            }
            
        }
    }

}
