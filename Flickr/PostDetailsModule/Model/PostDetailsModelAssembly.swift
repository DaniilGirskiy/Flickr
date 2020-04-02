//
//  PostDetailsModelAssembly.swift
//  JSONParsingApp
//
//  Created by Danya on 04.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

class PostDetailsModelAssembly {
    private lazy var storageAssembly = StorageAssembly1()
    
    func model(with index: Int) -> PostDetailsModel {
        let model = PostDetailsModelImpl()
        model.storage = storageAssembly.storage()
        model.index = index
        return model
    }
    
}
