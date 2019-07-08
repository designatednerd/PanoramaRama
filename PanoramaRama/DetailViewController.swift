//
//  DetailViewController.swift
//  PanoramaRama
//
//  Created by Ellen Shapiro on 7/7/19.
//  Copyright © 2019 Designated Nerd Software. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet private(set) var imageView: UIImageView!
    @IBOutlet private(set) var titleLabel: UILabel!
    @IBOutlet private(set) var locationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    var panorama: Panorama? {
        didSet {
            // Update the view.
            configureView()
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    } 
    
    func configureView() {
        guard let pano = self.panorama else {
            // Do nothing
            self.descriptionLabel?.text = nil
            return
        }
        
        self.descriptionLabel?.text = pano.description
        self.imageView?.image = pano.image
        self.title = pano.title
        self.titleLabel?.text = pano.title
        self.locationLabel?.text = pano.location
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }
}

