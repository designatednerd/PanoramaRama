//
//  AppDelegate.swift
//  PanoramaRama
//
//  Created by Ellen Shapiro on 7/7/19.
//  Copyright © 2019 Designated Nerd Software. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let navAppearnace = UINavigationBar.appearance()
        
        
        let textColor = UIColor(named: "LightText")!
        
        navAppearnace.barTintColor = UIColor(named: "BurntOrange")!
        navAppearnace.titleTextAttributes = [
            .foregroundColor: textColor
        ]
        
        
        navAppearnace.tintColor = textColor
        
        let barButtonAppearance = UIBarButtonItem.appearance()
        barButtonAppearance.tintColor = textColor
        
        let splitViewController = window!.rootViewController as! UISplitViewController
        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
        navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        splitViewController.delegate = self
        return true
    }

    // MARK: - Split view

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.panorama == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        
        return false
    }
}

