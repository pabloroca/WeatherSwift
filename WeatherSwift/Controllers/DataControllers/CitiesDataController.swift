//
//  CitiesDataController.swift
//  WeatherSwift
//
//  Created by Pablo Roca Rozas on 12/3/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation
import RealmSwift

open class CitiesDataController {
    
    var realm: Realm = try! Realm()
    
    /// initial setup
    open func setup() {
        let arrobjects = self.realm.objects(Cities.self)
        if arrobjects.isEmpty {
            do {
                try realm.write {
                    self.realm.add(Cities.init(id: 1, cityname: "London")!)
                    self.realm.add(Cities.init(id: 2, cityname: "Anchorage")!)
                    self.realm.add(Cities.init(id: 3, cityname: "Barcelona")!)
                    self.realm.add(Cities.init(id: 4, cityname: "Kiev")!)
                    self.realm.add(Cities.init(id: 5, cityname: "Paris")!)
                }
            } catch let error as NSError {
                print("setup - Something went wrong: \(error.localizedDescription)")
            }
        }
    }
    
    open func readAll() -> [Cities] {
        let results = self.realm.objects(Cities.self)
        return(Array(results))
    }
    
}

/// Factory method to create Cities object
//
extension Cities {
    convenience init?(id: Int, cityname: String?) {
        self.init()
        
        guard let cityname = cityname else {
            return nil
        }
        self.id = id
        self.cityname = cityname
    }
}
