//
//  PostDetailsViewControllerAssembly.swift
//  JSONParsingApp
//
//  Created by Danya on 04.03.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit

class PostDetailsViewControllerAssembly {
    private lazy var modelAssembly = PostDetailsModelAssembly()
    
    func postDetailsVC(index: Int) -> UIViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PostDetailsViewController") as! PostDetailsViewController
        vc.model = modelAssembly.model(with: index)
   
        return vc
    }
    
}
