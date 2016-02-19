//
//  Place.swift
//  Travel_Agency
//
//  Created by MobileApp on 2/9/16.
//  Copyright © 2016 MobileApp. All rights reserved.
//

import UIKit

class Place: NSObject, NSCoding {
    var title: String?
    var content: String?
    
    init( title: String, description: String) {
        self.title = title
        self.content = description
    }
   override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        if let titleDecoded = aDecoder.decodeObjectForKey("title") as? String{
            title = titleDecoded
        }
        if let contentDecoded = aDecoder.decodeObjectForKey("content") as? String{
            content = contentDecoded
        }
    }
    func encodeWithCoder(aCoder: NSCoder) {
        if let titleEncoded = title {
            aCoder.encodeObject(titleEncoded, forKey: "title")
        }
        if let contentEncoded = content {
            aCoder.encodeObject(contentEncoded, forKey: "content")
        }
    }
}
