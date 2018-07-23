//
//  ListYoutubeViewController.swift
//  myo-youtube
//
//  Created by Cristian Petra on 21/07/2018.
//  Copyright © 2018 artep. All rights reserved.
//

import UIKit

class ListYoutubeViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    
    
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

extension ListYoutubeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YoutubeVideoCell", for: indexPath) as! YoutubeVideoCell
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AppStoryboard.Main.instance.instantiateViewController(withIdentifier: "navigationController")
        self.present(vc, animated: true, completion: nil)
    }
}



