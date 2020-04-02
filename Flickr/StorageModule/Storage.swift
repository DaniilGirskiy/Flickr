//
//  Storage.swift
//  JSONParsingApp
//
//  Created by Danya on 23.02.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

protocol Storage {
    var output: StorageOutput? { get set }
    
    func changeStoragePostLikeState(at index: Int)

    var storagePosts: [StoragePost] { get set }
    
    func setStoragePosts(storagePosts: [StoragePost])
}

protocol StorageOutput {
    func collectionChanged(newValue: [StoragePost])
}

class StorageImpl: Storage {
    var output: StorageOutput?
    
    var storagePosts: [StoragePost] = []
    
    
    func setStoragePosts(storagePosts: [StoragePost]) {
        self.storagePosts = storagePosts
        output?.collectionChanged(newValue: storagePosts)
    }
    
    func changeStoragePostLikeState(at index: Int) {
        self.storagePosts[index] = StoragePost(id: storagePosts[index].id,
                                               title: storagePosts[index].title,
                                               url: storagePosts[index].url,
                                               isLiked: !storagePosts[index].isLiked)
        output?.collectionChanged(newValue: storagePosts)
      }
    
}

