//
//  Preferences.swift
//  oopConcepts Clearence
//
//  Created by Ahsan Iqbal on 25/10/2018.
//  Copyright © 2018 SelfIT. All rights reserved.
//

import Foundation
import UIKit

class Preference {
    
     static let shared = Preference()
     var sharedPreferences = UserDefaults.standard
     var value: String!
     var status: Bool!
     var array: Array<Any>!
     var dataObj: Notif!

    // set login Status
    func setStatus(value: Bool, currentLevelKey: String) {
        self.status = value
        if(currentLevelKey != "") {
            if(currentLevelKey == "isLogin"){
                sharedPreferences.set(value, forKey: currentLevelKey)
                sharedPreferences.synchronize()
            }
        }
    }
    // get values
    func getStatus(currentLevelKey: String) -> Bool {
        var returingValue: Bool!
        
        if(currentLevelKey != ""){
            if(!(sharedPreferences.bool(forKey: currentLevelKey) == nil)){
                returingValue = sharedPreferences.bool(forKey: currentLevelKey)
            } else {
                print("Data not saved yet")
                return false
            }
        }
        return returingValue
    }
    
    // set array vales
    func setArrayValue(array: Array<Any> , currentLevelKey: String) {
        
        self.array = array
        
        if currentLevelKey == "task" {
            sharedPreferences.set(array, forKey: currentLevelKey)
            sharedPreferences.synchronize()
        }
        if currentLevelKey == "date" {
            sharedPreferences.set(array, forKey: currentLevelKey)
            sharedPreferences.synchronize()
        }

    }
    
    
    //get array values
    func getArrayValue(currentLevelKey: String) -> Array<Any> {
        var arrayTobeReturned: Array<Any>!
        if(currentLevelKey == ""){
            // hendle error
        }
        if(currentLevelKey != ""){
            if(!(currentLevelKey.isEmpty) && !(sharedPreferences.array(forKey: currentLevelKey) == nil)){
                arrayTobeReturned = sharedPreferences.array(forKey: currentLevelKey)!
            } else {
                print("Data not saved yet")
                return []
            }
        }
        return arrayTobeReturned
    }
    
    // set values against keys
     func set(value: String, currentLevelKey: String) {
        self.value = value
        
        if(currentLevelKey != "") {
        if(currentLevelKey == "task"){
        sharedPreferences.set(value, forKey: currentLevelKey)
        sharedPreferences.synchronize()
        }
        if(currentLevelKey == "date"){
            sharedPreferences.set(value, forKey: currentLevelKey)
            sharedPreferences.synchronize()
        }
        if(currentLevelKey == "time"){
            sharedPreferences.set(value, forKey: currentLevelKey)
            sharedPreferences.synchronize()
        }
      }
    }
    
    // get values
    func get(currentLevelKey: String) -> String {
        var returingValue: String!
        
        if(currentLevelKey != ""){
            if(!(sharedPreferences.string(forKey: currentLevelKey) == nil)){
                returingValue = sharedPreferences.string(forKey: currentLevelKey)
            } else {
                print("Data not saved yet")
                return ""
            }
        }
        return returingValue
    }
    
    // save notif data obj
    func setData(value: Notif, currentLevelKey: String) {
        self.dataObj = value
        if(currentLevelKey != "") {
            let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: value)
            sharedPreferences.set(encodedData, forKey: currentLevelKey)
            sharedPreferences.synchronize()
        }
    }
    
    // get notif data values
    func getData(currentLevelKey: String) -> Notif {
        var returingValue: Data!
        var decoded: Notif!
        
        if(currentLevelKey == ""){
            // hendle error
        }
        if(currentLevelKey != ""){
            if(!(currentLevelKey.isEmpty)){
                returingValue = sharedPreferences.object(forKey: Constants.shared.currentLevelKeyNotif) as? Data
                decoded = NSKeyedUnarchiver.unarchiveObject(with: returingValue) as? Notif
            }
        }
        return decoded
        
    }
    
    // remove values
    func removeValues(key: String) {
        sharedPreferences.removeObject(forKey: key)
    }
}

