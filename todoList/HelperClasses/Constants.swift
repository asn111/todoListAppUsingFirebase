//
//  Constants.swift
//  Moment Clone
//
//  Created by Ahsan Iqbal on 06/11/2018.
//  Copyright © 2018 SelfIT. All rights reserved.
//

import Foundation
import UIKit

class Constants {
    
    static let shared = Constants()

    // checks
    var screenOneState: Bool = true
    var screenTwoState: Bool = true
    var screenTHreeState: Bool = true
    var selectedCheck: Bool = false
    var locPermitted: Bool = false
    var notifPermitted: Bool = false

    // Pref keys
    var currentLevelKeyTask = "task"
    var currentLevelKeyDate = "date"
    var currentLevelKeyTime = "time"
    var currentLevelKeyStatus = "isLogin"



}
