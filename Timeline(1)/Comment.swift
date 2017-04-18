//
//  Comment.swift
//  Timeline(1)
//
//  Created by handje on 4/17/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

import Foundation

class Comment {
    
    // MARK: - Properties
    
    let text: String
    let timestamp: Date
    let post: Post?
    
    
    // MARK: - Initializer
    
    init(text: String, timestamp: Date = Date(), post: Post?) {
        self.text = text
        self.timestamp = timestamp
        self.post = post
    }
}
