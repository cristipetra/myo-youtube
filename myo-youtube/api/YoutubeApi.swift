//
//  YoutubeApi.swift
//  myo-youtube
//
//  Created by Cristian Petra on 20/07/2018.
//  Copyright © 2018 artep. All rights reserved.
//

import Foundation
import Alamofire

class YoutubeApi {
    
    static let API_KEY = "AIzaSyCwbGziupadfpxuaTv72BsKZxOAQQDDj9A"
    static let search = "https://www.googleapis.com/youtube/v3/search"
    static let comments = "https://www.googleapis.com/youtube/v3/commentThreads"
    
    func getVideos(_ title: String, callback: @escaping (_ response: YoutubeSearch?) -> Void) {
        let youtubeURL = YoutubeApi.search + "?q=" + title + "&maxResults=25&part=snippet&key=" + YoutubeApi.API_KEY
        
        Alamofire.request(youtubeURL).responseJSONDecodable { (response: DataResponse<YoutubeSearch>) in
            callback(response.result.value)
        }
        
    }

}

