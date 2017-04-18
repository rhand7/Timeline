//
//  PostController.swift
//  Timeline(1)
//
//  Created by handje on 4/17/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

import Foundation
import UIKit

class PostController {
    
    static let sharedController = PostController()
    
    // MARK: - createPost
    
    func createPostWith(image: UIImage, caption: String, completion: ((Post) -> Void)?) {
        guard let data = UIImageJPEGRepresentation(image, 0.8) else { return }
        
        let post = Post(photoData: data, timestamp: Date())
        posts.append(post)
        let captionComment = addComment(toPost: post, commentText: caption) 
        
    }
    
    
    // MARK: - addComment
    
    @discardableResult func addComment(toPost post: Post,
                                       commentText: String,
                                       completion: @escaping ((Comment) -> Void) = { _ in}) -> Comment {
        
        let comment = Comment(text: commentText, post: post)
        post.comments.append(comment)
     
        return comment
    }

    
    
    
    // MARK: - Properties
    
    var posts = [Post]()
}
