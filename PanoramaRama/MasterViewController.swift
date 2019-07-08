//
//  MasterViewController.swift
//  PanoramaRama
//
//  Created by Ellen Shapiro on 7/7/19.
//  Copyright © 2019 Designated Nerd Software. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    let panos = Panorama.all

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       self.title = "Panoramas"
        self.tableView.register(PanoramaCell.nib, forCellReuseIdentifier: PanoramaCell.identifier)
        self.tableView.tableFooterView = UIView()
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController?.isCollapsed ?? true
        super.viewWillAppear(animated)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }
        
        switch identifier {
        case "showDetail":
            guard let indexPath = self.tableView.indexPathForSelectedRow else {
                // Nothing is selected!
                return
            }
            let pano = self.panos[indexPath.row]
            
            guard
                let navController = segue.destination as? UINavigationController,
                let destination = navController.topViewController as? DetailViewController else {
                    return
            }
            
            destination.panorama = pano
            destination.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
            destination.navigationItem.leftItemsSupplementBackButton = true
        default:
            assertionFailure("This isn't handled!")
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.panos.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 123.0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PanoramaCell.identifier, for: indexPath) as? PanoramaCell else {
            return UITableViewCell()
        }
        let pano = self.panos[indexPath.row]
        cell.configure(for: pano)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "showDetail", sender: nil)
    }
}

