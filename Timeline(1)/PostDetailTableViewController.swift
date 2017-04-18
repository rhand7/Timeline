//
//  PostDetailTableViewController.swift
//  Timeline(1)
//
//  Created by handje on 4/17/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 40
        
        updateViews()
    
    }
    
   
    // MARK: - Properties
    
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
   
    // MARK: - IB Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    // MARK: - IB Actions 
    
    @IBAction func CommentButtonTapped(_ sender: Any) {
        presentCommentAlert() 
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
    }
    
    @IBAction func followPostButtonTapped(_ sender: Any) {
    }
    
   
    
    // MARK: - Private
    
    private func updateViews() {
        guard let post = post, isViewLoaded else { return }
        
        imageView.image = post.photo
        tableView.reloadData()
        
    }

    
    // MARK: - TableViewDataSource
    
    //#OfRows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post?.comments.count ?? 0
    }

    //cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
        
        guard let post = post else { return cell }
        
        let comment = post.comments[indexPath.row]
        
        cell.textLabel?.text = comment.text

        return cell
    }
    
    
    // MARK: - Alerts
    
    func presentCommentAlert() {
        
        let alertController = UIAlertController(title: "Add Comment", message: nil, preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            
            textField.placeholder = "Great pic!"
    }
        
        let addCommentAction = UIAlertAction(title: "Add Comment", style: .default) { (action) in
            
            guard let commentText = alertController.textFields?.first?.text,
                let post = self.post else { return }
            
            PostController.sharedController.addComment(toPost: post, commentText: commentText)
            
        }
        
        alertController.addAction(addCommentAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }

}











