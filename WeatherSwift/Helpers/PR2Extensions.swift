//
//  PR2Extensions.swift
//  WeatherSwift
//
//  Created by Pablo Roca Rozas on 12/3/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

// requires Alamofire / AlamofireImage / PR2Common
extension UIImageView {
    func PR2ImageFromNetwork(_ imageURL: String, indicatorStyle: UIActivityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: indicatorStyle)
        indicator.center = self.center;// it will display in center of image view
        self.addSubview(indicator)
        indicator.startAnimating()

        Alamofire.request(imageURL, method: .get)
            .responseImage { response in
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                indicator.stopAnimating()
                indicator.isHidden = true
                indicator.removeFromSuperview()
                if let image = response.result.value {
                    //                    let image = UIImage(data: response.data!, scale: UIScreen.mainScreen().scale)!
                    self.image = image
                }
        }
    }
}
