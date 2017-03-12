//
//  ForeCastDataController.swift
//  WeatherSwift
//
//  Created by Pablo Roca Rozas on 12/3/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation
import RealmSwift
import SwiftyJSON

open class ForeCastDataController {
    
    var realm: Realm = try! Realm()
    
    open func readAll() -> [ForeCast] {
        let results = self.realm.objects(ForeCast.self)
        return(Array(results))
    }
    
    open func deleteAll() {
        do {
            try realm.write {
                realm.delete(self.readAll())
            }
        } catch let error as NSError {
            print("deleteAll - Something went wrong: \(error.localizedDescription)")
        }
    }
    
    open func addFromJSON(
        _ json: JSON,
        completionHandler: (_ success: Bool) -> Void) {
        self.deleteAll()
        
        do {
            try realm.write {
                for (_, subJson):(String, JSON) in json["list"] {
                    if let forecast = ForeCast.init(json: subJson) {
                        self.realm.add(forecast)
                    }
                }
                completionHandler(true)
            }
        } catch let error as NSError {
            print("addFromJSON - Something went wrong: \(error.localizedDescription)")
            completionHandler(false)
        }
    }
    
}

/// Factory method to create ForeCast object
//
extension ForeCast {
    convenience init?(json: JSON) {
        self.init()
        
        if let clouds = json["clouds"]["all"].int {
            self.clouds = clouds
        } else {
            self.clouds = 0
        }
        if let dt = json["dt"].int64 {
            self.dt = dt
        } else {
            self.dt = 0
        }
        if let icon = json["weather"][0]["icon"].string {
            self.icon = icon
        } else {
            self.icon = ""
        }
        if let temp_max = json["main"]["temp_max"].double {
            self.tempMax = temp_max
        } else {
            self.tempMax = 0
        }
        if let temp_min = json["main"]["temp_min"].double {
            self.tempMin = temp_min
        } else {
            self.tempMin = 0
        }
        if let wdescription = json["weather"][0]["description"].string {
            self.wdescription = wdescription
        } else {
            self.wdescription = ""
        }
        if let windspeed = json["wind"]["speed"].double {
            self.windspeed = windspeed
        } else {
            self.windspeed = 0
        }
        
    }
}
