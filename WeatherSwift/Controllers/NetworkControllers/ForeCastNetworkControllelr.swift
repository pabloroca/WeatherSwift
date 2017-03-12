//
//  ForeCastNetworkControllelr.swift
//  WeatherSwift
//
//  Created by Pablo Roca Rozas on 12/3/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

open class ForeCastNetworkController {
    
    open func readForeCastForCity(
        _ cityname: String, completionHandler: @escaping (_ success: Bool) -> Void
        ) {
        let endpoint = String(format: EndPoints.forecast5, cityname)
        Alamofire.request(endpoint, method: .get).responseJSON { response in
            if response.result.isSuccess, let value = response.result.value {
                //debugPrint(JSON(value))
                ForeCastDataController().addFromJSON(JSON(value), completionHandler: { (success) in
                    completionHandler(true)
                })
            } else {
                completionHandler(false)
            }
        }
    }
    
}
