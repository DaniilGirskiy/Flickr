//
//  InformationViewController.swift
//  JSONParsingApp
//
//  Created by Danya on 15.02.2020.
//  Copyright © 2020 Daniil Girskiy. All rights reserved.
//

import UIKit
import FlickrNetworking
import Kingfisher


class PostDetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    var model: PostDetailsModel! // injected
    var likeState: LikeState!
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.load()
        
        myImageView.kf.setImage(with: model.post.url)
        likeState = model.post.isLiked ? .fill : .empty
        likeButton.setImage(UIImage(systemName: likeState.rawValue), for: .normal)
        
    }
    
    @IBAction func likeButtonPressed() {

        model.toggleLikeButton()
        likeState.changeState()
        likeButton.setImage(UIImage(systemName: likeState.rawValue), for: .normal)
        
    }
}

enum LikeState: String {
    case fill = "heart.fill"
    case empty = "heart"
    
    mutating func changeState() {
        switch self {
        case .fill:
            self = .empty
        case .empty:
            self = .fill
        }
    }
}

