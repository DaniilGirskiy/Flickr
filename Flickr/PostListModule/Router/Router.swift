//
//  Router.swift
//  JSONParsingApp
//
//  Created by Danya on 15.02.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import Foundation
import FlickrNetworking

class RouterAssembly {
    
    var router: Router {
        let router = RouterImpl()
        return router
    }
    
}

protocol Router {
    func show(in vc: UIViewController, index: Int)
}

class RouterImpl: Router {
    var postDetailsViewControllerAssembly = PostDetailsViewControllerAssembly()
    
    func show(in vc: UIViewController, index: Int) {
        vc.navigationController?.pushViewController(postDetailsViewControllerAssembly.postDetailsVC(index: index), animated: true)
    }
}
