//
//  CitiesDataTests.swift
//  WeatherSwift
//
//  Created by Pablo Roca Rozas on 12/3/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import XCTest
import RealmSwift
@testable import WeatherSwift

class CitiesDataTests: XCTestCase {
    
    var realm: Realm = try! Realm()
    var dataController: CitiesDataController?
    
    override func setUp() {
        super.setUp()
        
        self.dataController = CitiesDataController()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // clear database
        self.deleteLocalData()
        self.dataController?.setup()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        // clear database
        self.deleteLocalData()
    }

    func deleteLocalData() {
        do {
            try realm.write {
                realm.delete(self.dataController!.readAll())
            }
        } catch let error as NSError {
            print("deleteAll - Something went wrong: \(error.localizedDescription)")
        }
    }
    
    func testReadLocalData() {
        let cities = self.dataController!.readAll()
        if !cities.isEmpty {
            XCTAssert(true, "Pass")
        } else {
            XCTFail()
        }
    }
    
    func testDeleteLocalData() {
        self.deleteLocalData()
        let cities = self.dataController!.readAll()
        if cities.isEmpty {
            XCTAssert(true, "Pass")
        } else {
            XCTFail()
        }
    }
    
}
