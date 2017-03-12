//
//  ForeCast.swift
//  WeatherSwift
//
//  Created by Pablo Roca Rozas on 12/3/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation
import RealmSwift

public class ForeCast: Object {

    dynamic var dt: Int64 = 0
    dynamic var clouds: Int = 0
    dynamic var icon: String = ""
    dynamic var tempMax: Double = 0
    dynamic var tempMin: Double = 0
    dynamic var wdescription: String = ""
    dynamic var windspeed: Double = 0
    
}
