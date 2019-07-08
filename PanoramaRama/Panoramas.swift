//
//  Panoramas.swift
//  PanoramaRama
//
//  Created by Ellen Shapiro on 7/7/19.
//  Copyright © 2019 Designated Nerd Software. All rights reserved.
//

import UIKit

struct Panorama {
    let image: UIImage
    let title: String
    let location: String
    let description: String
    
    static var all: [Panorama] {
        return [
            Panorama(image: UIImage(named: "matterhorn")!,
                     title: "Matterhorn",
                     location: "Switzerland",
                     description: "Panorama of the Alps around the Matterhorn taken in 2005"),
            Panorama(image: UIImage(named: "durian")!,
                     title: "The Durian",
                     location: "Singapore",
                     description: "Panorama of Singapore's \"Durian\" concert hall building taken in 2013. Named after an extremely foul-smelling fruit."),
            Panorama(image: UIImage(named: "prayer_wheel")!,
                     title: "Prayer Wheel",
                     location: "Singapore",
                     description: "A buddhist prayer wheel surrounded by mini buddhas in a temple in Singapore. Taken in 2013."),
            Panorama(image: UIImage(named: "warsaw")!,
                     title: "Warsaw Old Square",
                     location: "Poland",
                     description: "The old square in Warsaw, which had to be totally reconstructed after WWII. Taken in 2018."),
            Panorama(image: UIImage(named: "ross_lake")!,
                     title: "Ross Lake National Forest",
                     location: "Washington, USA",
                     description: "A very pretty lake in eastern Washington state. Taken in 2016."),
        ]
    }
}


