//
//  PlaceManager.swift
//  Travel_Agency
//
//  Created by MobileApp on 2/9/16.
//  Copyright © 2016 MobileApp. All rights reserved.
//

import UIKit

class PlaceManager: NSObject {

    static var places = [Place]()
    
    class func addPlace(title: String, content: String) {
        let place = Place (title: title, description: content)
        places.append(place)
    }
    
    class  func deletePlace(id: Int){
        places.removeAtIndex(id)
    }
    
    class func getPlaceAtIndex(id: Int) -> Place {
       
        if(places.count > 0){
            return places[id]
        }
        return Place()
    }
}
