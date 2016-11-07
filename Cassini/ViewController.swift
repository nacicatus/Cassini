//
//  ViewController.swift
//  Cassini
//
//  Created by Saurabh Sikka on 04/09/16.
//  Copyright (c) 2016 Saurabh Sikka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISplitViewControllerDelegate {
    
//    private struct Storyboard {
//        static let ShowImageSegue = "Show Image"
//        
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitViewController?.delegate = self
        
    }
    
    // code to make the list appear first, not the empty image view
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        if primaryViewController.contentViewController == self {
            if let ivc = secondaryViewController.contentViewController as? ImageViewController, ivc.imageURL == nil {
                return true
            }
        }
        return false
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == Storyboard.ShowImageSegue {
       if let ivc = (segue.destination as! UINavigationController).contentViewController as? ImageViewController {
            
//            let imageName = (sender as? UIButton)?.currentTitle
//            ivc.imageURL = DemoURL.NASAImageNamed(imageName)
//            ivc.title = imageName
            
            
            
            if let identifier = segue.identifier {
                switch identifier {
                    case "Earth":
                    ivc.imageURL = DemoURL.NASA.Earth as URL?
                    ivc.title = "Earth"
                    case "Cassini":
                    ivc.imageURL = DemoURL.NASA.Cassini as URL?
                    ivc.title = "Cassini"
                    case "Saturn":
                    ivc.imageURL = DemoURL.NASA.Saturn as URL?
                    ivc.title = "Saturn"
                default: break
                }
            }
        }
//    }
    }


}

extension UIViewController {
    var contentViewController: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        } else {
            return self
        }
    }
}
