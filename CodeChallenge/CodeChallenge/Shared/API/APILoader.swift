//
//  APILoader.swift
//  CodeChallenge
//
//  Created by KhaiHoang on 5/23/17.
//  Copyright © 2017 iOSDev. All rights reserved.
//

import Foundation
import UIKit

class APIPhoto: NSObject {
    static let api = APIPhoto(urlString: APIHelper.getPhotoFromURL())
    var urlString: String
    init(urlString: String) {
        self.urlString = urlString
    }
    
    func getPhotos(withCompletion completion: @escaping ((_ photos: [Photos]?, _ error: Error?) -> Void)) {
        let url = URL(string: self.urlString)!
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 20)
        request.httpMethod = RequestMethod.GET.rawValue
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, respond, error) in
            
            guard let data = data else {
                return
            }
            
            DispatchQueue.main.async {
                if let error = error {
                    completion(nil, error)
                } else {
                    let dict = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject]
                    let photosDict = dict!["photos"] as! [[String: AnyObject]]
                    
                    var photos = [Photos]()
                    for photoDict in photosDict {
                        let photo = Photos(dict: photoDict)
                        photos.append(photo)
                    }
                    completion(photos, nil)
                }
            }
        }
        task.resume()
    }
}

