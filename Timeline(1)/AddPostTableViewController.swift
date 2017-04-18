//
//  AddPostTableViewController.swift
//  Timeline(1)
//
//  Created by handje on 4/17/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {
    
    // MARK: - Properties
    
    var image: UIImage?
    
    // MARK: - IB Actions
    
    @IBAction func selectImageButtonTapped(_ sender: Any) {
    }
    
    @IBAction func addPostButtonTapped(_ sender: Any) {
        
        if let image = image, 
            let caption = captionTextField.text {
            
            PostController.sharedController.createPostWith(image: image, caption: caption) { (_) in
                self.dismiss(animated: true, completion: nil)
            }
            
        } else {
            
            let alertController = UIAlertController(title: "Missing Post Information", message: "Check your image and caption adn try again.", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            
            present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var captionTextField: UITextField!
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
