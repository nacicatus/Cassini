//
//  DemoURL.swift
//  Cassini
//
//  Created by Saurabh Sikka on 04/09/16.
//  Copyright (c) 2016 Saurabh Sikka. All rights reserved.
//

import Foundation

struct DemoURL {
    static let Stanford = NSURL(string: "https://s3-us-west-2.amazonaws.com/insideiim/wp-content/uploads/2016/05/26014711/stanford-campus.png")
    
    struct NASA {
        
//        static let Cassini = NSURL(string: "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg")
//        static let Earth = NSURL(string: "http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg")
//        static let Saturn = NSURL(string: "http://www.nasa.gov/sites/default/files/saturn_collage.jpg")
        
        // replaced original demo links with quicker loading images that are till large enough to require UIScrollView
        static let Cassini = NSURL(string: "http://forum.celestialmatters.org/userpix/7_cassini_1.jpg")
        static let Earth = NSURL(string: "https://saturn.jpl.nasa.gov/system/resources/detail_files/5868_IMG004868.jpg")
        static let Saturn = NSURL(string: "http://apod.nasa.gov/apod/image/0901/newrings_cassini_big.jpg")
    }
}