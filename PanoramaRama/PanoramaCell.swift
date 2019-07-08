//
//  PanoramaCell.swift
//  PanoramaRama
//
//  Created by Ellen Shapiro on 7/7/19.
//  Copyright © 2019 Designated Nerd Software. All rights reserved.
//

import UIKit

class PanoramaCell: UITableViewCell {
    
    static let identifier = "PanoramaCell"
    static let nib = UINib(nibName: "PanoramaCell", bundle: nil)
    
    @IBOutlet private(set) var panoImageView: UIImageView!
    @IBOutlet private(set) var titleLabel: UILabel!
    @IBOutlet private(set) var locationLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.panoImageView.image = nil
        self.titleLabel.text = nil
        self.locationLabel.text = nil
    }
    
    func configure(for panorama: Panorama) {
        self.panoImageView.image = panorama.image
        self.locationLabel.text = panorama.location
        self.titleLabel.text = panorama.title
    }
}
