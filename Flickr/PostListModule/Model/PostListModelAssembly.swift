//
//  PostListModelAssembly.swift
//  JSONParsingApp
//
//  Created by Danya on 04.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation
import FlickrNetworking

class PostListModelAssembly {
    lazy var storageAssembly = StorageAssembly1() // singletone
    lazy var networkAssembly = NetworkServiceAssembly()
    
    
    var model: PostListModel {
        let model = PostListModelImpl()

        model.storage = storageAssembly.storage()
        model.network = networkAssembly.network
        
        model.storage.output = model

        return model
    }
    
}

