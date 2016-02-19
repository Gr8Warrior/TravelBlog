//
//  NSUserDefaultsManager.swift
//  Travel_Agency_11
//
//  Created by MobileApp on 2/11/16.
//  Copyright © 2016 MobileApp. All rights reserved.
//

import UIKit

class NSUserDefaultsManager: NSObject {
    static let userDefaults = NSUserDefaults.standardUserDefaults()
    
    class func synchronize() {
        let myData = NSKeyedArchiver.archivedDataWithRootObject(PlaceManager.places)
        NSUserDefaults.standardUserDefaults().setObject(myData, forKey: "placeArray")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
     class func initializeDefaults() {
        if let placesRaw = NSUserDefaults.standardUserDefaults().dataForKey("placeArray") {
            if let places = NSKeyedUnarchiver.unarchiveObjectWithData(placesRaw) as? [Place] {
                PlaceManager.places = places
            }
        }
    }
}
