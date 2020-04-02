//
//  PostDetailsModel.swift
//  JSONParsingApp
//
//  Created by Danya on 04.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

protocol PostDetailsModel {
    func load()
    
    var post: PresentationPostDetails! { get set }
    
    func toggleLikeButton()
    
    
}

class PostDetailsModelImpl: PostDetailsModel {
    var storage: Storage! // injected
    var index: Int!  // injected
    
    var post: PresentationPostDetails!
    
    
    func load() {
        post = PresentationPostDetails(url: storage.storagePosts[index].url,
                                       isLiked: storage.storagePosts[index].isLiked)
    }
    
    
    func toggleLikeButton() {
        storage.changeStoragePostLikeState(at: index)
    }
    
}

