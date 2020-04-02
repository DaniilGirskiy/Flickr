//
//  PostListModel.swift
//  JSONParsingApp
//
//  Created by Danya on 04.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit
import FlickrNetworking

protocol PostListModel {
    var output: PostListModelOutput? { get set }
    
    func load()
    var fullposts: [PresentationPost] { get set } 
}

protocol PostListModelOutput {
    func updateViewFromModel()
}


class PostListModelImpl: PostListModel {
    var output: PostListModelOutput?
    
    var storage: Storage! // injected
    var network: NetworkService! // injected
    
    var fullposts: [PresentationPost] = []
    
    func load() {
        let urlString = "https://www.flickr.com/services/rest?method=flickr.interestingness.getList&api_key=3988023e15f45c8d4ef5590261b1dc53&format=json&nojsoncallback=1#photos/photo"
        
        network.get(urlString: urlString) { (result) in
            self.storage.setStoragePosts(storagePosts: result.map{ (post) -> StoragePost in
                return StoragePost(id: post.id, title: post.title, url: post.url, isLiked: false)
            })
        }
    }

}

extension PostListModelImpl: StorageOutput {
    func collectionChanged(newValue: [StoragePost]) {
        fullposts = newValue.map{ (storagePost) -> PresentationPost in
            return PresentationPost(id: storagePost.id,
                                    title: storagePost.title,
                                    url: storagePost.url,
                                    isLiked: storagePost.isLiked)
        }
        
        self.output?.updateViewFromModel()
    }
}
