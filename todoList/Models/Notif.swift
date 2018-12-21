//
//  Notif.swift
//  todoList
//
//  Created by Ahsan Iqbal on 19/12/2018.
//  Copyright © 2018 SelfIT. All rights reserved.
//

import UIKit
import Foundation

class Alert: NSObject, NSCoding {
    
    var title: String!
    var body: String!
    
    override init() {
        title = ""
        body = ""
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(body, forKey: "body")

    }
    
    required init?(coder aDecoder: NSCoder) {
        title = (aDecoder.decodeObject(forKey: "title") as? String)!
        body = (aDecoder.decodeObject(forKey: "body") as? String)!
    }
}

class Notif: NSObject, NSCoding {
    
    var alert: Alert!
    
    override init() {
        alert = Alert()
    }
    
    required init?(coder aDecoder: NSCoder) {
        alert = (aDecoder.decodeObject(forKey: "alert") as? Alert)!
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(alert, forKey: "alert")
        
    }
    
}
