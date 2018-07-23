//
//  ListYoutubeViewController.swift
//  myo-youtube
//
//  Created by Cristian Petra on 21/07/2018.
//  Copyright © 2018 artep. All rights reserved.
//

import UIKit
import EZLoadingActivity

class ListYoutubeViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var videos: [YoutubeVideo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableHeaderView = self.searchBar
        registerCellsForTable()

    }

    internal func registerCellsForTable() {
        let youtubeCell = UINib(nibName: "YoutubeVideoCell", bundle: nil)
        tableView.register(youtubeCell, forCellReuseIdentifier: "YoutubeVideoCell")
    }
    
}

// MARK: - Table view
extension ListYoutubeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YoutubeVideoCell", for: indexPath) as! YoutubeVideoCell
        cell.configure(videos[indexPath.item])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: UINavigationController = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "navigationController") as! UINavigationController
        (vc.viewControllers.first as? YoutubeDetailsViewController)?.configure(videos[indexPath.row])
        
        
        self.present(vc, animated: true, completion: nil)
        
    }
    
}

// MARK: - UISearchBarDelegate
extension ListYoutubeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        EZLoadingActivity.show("Loading...", disableUI: false)
        YoutubeApi().getVideos(searchBar.text!) { (response) in
            EZLoadingActivity.hide()
            if let items = response?.items {
                self.videos = items
                self.tableView.reloadData()
            }
        }
    }

}
