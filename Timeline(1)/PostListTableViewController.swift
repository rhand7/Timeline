//
//  PostListTableViewController.swift
//  Timeline(1)
//
//  Created by handje on 4/17/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

import UIKit

class PostListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - TableViewDataSource

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostController.sharedController.posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as? PostTableViewCell else { return PostTableViewCell() }

        let posts = PostController.sharedController.posts
        cell.post = posts[indexPath.row]

        return cell
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toPostDetail" {
            
            if let detailViewController = segue.destination as? PostDetailTableViewController,
                let selectedIndexPath = self.tableView.indexPathForSelectedRow {
                
                let posts = PostController.sharedController.posts
                detailViewController.post = posts[selectedIndexPath.row]   
            }
        }
    }

}



















