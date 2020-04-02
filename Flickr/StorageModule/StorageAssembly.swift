//
//  StorageAssembly.swift
//  JSONParsingApp
//
//  Created by Danya on 23.02.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation

class StorageAssembly {
    
    var storage: Storage {
        let storage = StorageImpl()
        return storage
    }
    
}

class StorageAssembly1 {                          // singletone
    private static let storage = StorageImpl()
    
    func storage(with output: StorageOutput?) -> Storage {
        StorageAssembly1.storage.output = output
        return StorageAssembly1.storage
    }
    
    func storage() -> Storage {
        return StorageAssembly1.storage
    }
}
