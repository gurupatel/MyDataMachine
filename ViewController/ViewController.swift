//
//  ViewController.swift
//  MyDataMachine
//
//  Created by Gaurang Patel on 29/04/24.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Declaration of IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Declaration of Variables

    var activityIndicator: UIActivityIndicatorView!

    var posts: [Post] = []
    var currentPage = 1
    var totalPages = 100
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    
        let nib = UINib(nibName: "PostViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "PostViewCell")

        // Initialize activity indicator
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        view.addSubview(activityIndicator)

        fetchPosts()
    }
    
    func fetchPosts() {
        // Show activity indicator
        activityIndicator.startAnimating()

        // Perform heavy computation for displaying additional details
        let startTime = Date()

        // Fetch data from API
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts?_page=\(currentPage)") else { return }
        
        isLoading = true
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let newPosts = try decoder.decode([Post].self, from: data)
                self.posts += newPosts
                
                // Update UI on the main queue
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.tableView.reloadData()
                    self.activityIndicator.stopAnimating()
                    
                    // Your heavy computation logic here
                    let endTime = Date()
                    let timeElapsed = endTime.timeIntervalSince(startTime)
                    debugPrint("Time taken for heavy computation: \(timeElapsed) seconds")
                }
            } catch {
                debugPrint("Error decoding JSON: \(error)")
            }
        }.resume()
    }
    
    func showDetailedView(for item: Post) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailedVC = storyboard.instantiateViewController(withIdentifier: "DetailedViewController") as? DetailedViewController {
            detailedVC.post = item // Pass the selected item to the detailed view controller
            present(detailedVC, animated: true, completion: nil)
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostViewCell", for: indexPath) as? PostViewCell
        let post = posts[indexPath.row]
        cell?.lblId.text = "\(post.id)"
        cell?.lblTitle.text = "\(post.title)"
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let post = posts[indexPath.row]
        self.showDetailedView(for: post)
    }
}

extension ViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offsetY > contentHeight - height {
            // Load more data if not already loading and not at the end of the data
            if !isLoading && currentPage < totalPages {
                currentPage += 1
                fetchPosts()
            }
        }
    }
}

