//
//  Post.swift
//  Timeline(1)
//
//  Created by handje on 4/17/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

import Foundation
import UIKit

class Post {
    
    // MARK: - Properties
    
    let photoData: Data?
    let timestamp: Date
    var comments: [Comment]
    var photo: UIImage? {
        guard let photoData = self.photoData else { return nil }
        return UIImage(data: photoData)
    }
    
    // MARK: - Initializer
    
    init(photoData: Data?, timestamp: Date, comments: [Comment] = []) {
        self.photoData = photoData
        self.timestamp = timestamp
        self.comments = comments 
    } 
    
}
