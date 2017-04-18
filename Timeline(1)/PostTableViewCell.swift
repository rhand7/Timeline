//
//  PostTableViewCell.swift
//  Timeline(1)
//
//  Created by handje on 4/17/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    // MARK: - IB Outlets 
    
    @IBOutlet weak var postImageView: UIImageView!
    
    // MARK: - Properties
    
    var post: Post? {
        didSet {
            updateViews()
        }
    }

    // MARK: - Private
    
    private func updateViews() {
        postImageView.image = post?.photo
    }
}
