//
//  PostsListViewControllerAssembly.swift
//  JSONParsingApp
//
//  Created by Danya on 04.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class PostsListViewControllerAssembly {
    private lazy var modelAssembly = PostListModelAssembly()
    private lazy var routerAssembly = RouterAssembly()
    
    var viewController: UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navController = storyboard.instantiateViewController(identifier: "StartNavVC") as! UINavigationController
        
        let vc = navController.viewControllers[0] as! PostsListViewController
        vc.router = routerAssembly.router
        vc.model = modelAssembly.model
        vc.model.output = vc
        
        return navController
    }
    
}
