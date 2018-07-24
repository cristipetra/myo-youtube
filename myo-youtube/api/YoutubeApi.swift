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
    
    func escapedUrl(_ url: String) -> String {
        return url.addingPercentEncoding(
            withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    }
    
    func getVideos(_ title: String, callback: @escaping (_ response: YoutubeSearch?, _ error: ApiError?) -> Void) {
        
        let youtubeURL = escapedUrl( YoutubeApi.search + "?q=" + title + "&maxResults=25&part=snippet&type=video&key=" + YoutubeApi.API_KEY )
        
        Alamofire.request(youtubeURL).responseJSONDecodable { (response: DataResponse<YoutubeSearch>) in
            if response.result.error == nil {
                callback(response.result.value, nil)
            } else {
                callback(nil, ApiError())
            }
        }
        
    }

    func getComments(_ videoId: String, callback: @escaping (_ response: YoutubeCommentList?) -> Void) {
        
        let commentsURL = escapedUrl( YoutubeApi.comments + "?videoId=" + videoId + "&part=snippet&key=" + YoutubeApi.API_KEY )
        
        Alamofire.request(commentsURL).responseJSONDecodable { (response: DataResponse<YoutubeCommentList>) in
            callback(response.result.value)
        }

    }
}

struct ApiError {
    var message: String = "Please try again later"
    var title: String = "Error"
}
