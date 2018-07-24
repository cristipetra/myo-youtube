//
//  YoutubeComment.swift
//  myo-youtube
//
//  Created by Cristian Petra on 23/07/2018.
//  Copyright © 2018 artep. All rights reserved.
//

import Foundation

struct YoutubeCommentList: Codable {
    var etag: String
    var nextPageToken: String?
    
    var items: [CommentItem]
}

struct CommentItem: Codable {
    var etag: String
    var id: String
    
    struct CommentSnippetTop: Codable {
        var videoId: String
        
        struct TopLevelComment: Codable {
            var id: String
            
            struct CommentSnippet: Codable {
                var textDisplay: String
            }
            var snippet: CommentSnippet
        }
        
        var topLevelComment: TopLevelComment
    }
    
    var snippet: CommentSnippetTop
}
