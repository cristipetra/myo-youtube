//
//  YoutubeVideo.swift
//  myo-youtube
//
//  Created by Cristian Petra on 23/07/2018.
//  Copyright © 2018 artep. All rights reserved.
//

import Foundation

struct YoutubeVideo: Codable {
    var snippet: YoutubeSnippet
    var etag: String
    var id: YoutubeVideoId
}


struct YoutubeVideoId: Codable {
    var videoId: String?
    var kind: String
}

struct YoutubeSnippet: Codable {
    var title: String
    var thumbnails: YoutubeThumbnails
    
}

struct YoutubeThumbnails: Codable {
    var medium: YoutubeThumbnail
    var defaultThumbnail: YoutubeThumbnail
    
    enum CodingKeys: String, CodingKey {
        case medium = "medium"
        case defaultThumbnail = "default"
    }
}

struct YoutubeThumbnail: Codable {
    var url: URL
}

struct YoutubeSearch: Codable {
    var etag: String
    var regionCode: String
    var items: [YoutubeVideo]
}
