//
//  ImageViewController.swift
//  Cassini
//
//  Created by Saurabh Sikka on 04/09/16.
//  Copyright (c) 2016 Saurabh Sikka. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
    
    
    // Model
    var imageURL: NSURL? {
        didSet {
            image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    // This time do multithreading
    private func fetchImage() {
        
        if let url = imageURL {
            spinner?.startAnimating() // added a spinner when you make a network request
            let qos = Int(QOS_CLASS_USER_INITIATED.value) // put that network request on another queue
            dispatch_async(dispatch_get_global_queue(qos, 0)) { () -> Void in
                let imageData = NSData(contentsOfURL: url) // get the image in the background in another queue that was user initiated
                dispatch_async(dispatch_get_main_queue()) { // and put the result of that SLOW queu back on the main queue, once it's downloaded from the Web
                    if url == self.imageURL { // just checking that the image being returned is the one asked for by the user
                        if imageData != nil {
                            self.image = UIImage(data: imageData!) // we have to put self. because it's capturing the image var from the closure
                        } else {
                            self.image = nil
                        }
                    }
                }
            }
        }
    }
    
    // View
    private var imageView = UIImageView()
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    private var image: UIImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size // The ?. sets image internally even if outlets aren't set yet
            spinner?.stopAnimating() // stop the spinner when the image is set
        }
    }
    
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            // set the content size
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
            // Zoom scales
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 1.0
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            fetchImage()
        }
    }

}
