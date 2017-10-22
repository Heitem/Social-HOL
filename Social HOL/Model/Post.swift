//
//  Post.swift
//  Social HOL
//
//  Created by Heitem OULED-LAGHRIYEB on 10/10/17.
//  Copyright © 2017 Heitem OULED-LAGHRIYEB. All rights reserved.
//

import Foundation
import Firebase

class Post {
    private var _caption: String!
    private var _imageUrl: String!
    private var _likes: Int!
    private var _postKey: String!
    private var _postRef: DatabaseReference!
    
    var caption: String {
        return _caption
    }
    
    var imageUrl: String {
        return _imageUrl
    }
    
    var likes: Int {
        return _likes
    }
    
    var postKey: String {
        return _postKey
    }
    
    init(caption: String, imageUrl: String, likes: Int) {
        _caption = caption
        _imageUrl = imageUrl
        _likes = likes
        _postRef = DataService.ds.REF_POSTS.child(_postKey)
    }
    
    init(postKey: String, postData: Dictionary<String, AnyObject>) {
        if let caption = postData["caption"] as? String {
            _caption = caption
        }
        if let imageUrl = postData["imageUrl"] as? String {
            _imageUrl = imageUrl
        }
        if let likes = postData["likes"] as? Int {
            _likes = likes
        }
        _postKey = postKey
        _postRef = DataService.ds.REF_POSTS.child(_postKey)
    }
    
    func ajustLikes(addLikes: Bool) {
        if addLikes {
            _likes = _likes + 1
        } else {
            _likes = _likes - 1
        }
        _postRef.child("likes").setValue(_likes)
    }
}
