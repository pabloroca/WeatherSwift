//
//  ForeCastCell.swift
//  WeatherSwift
//
//  Created by Pablo Roca Rozas on 12/3/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import UIKit
import SwiftDate

class ForeCastCell: UITableViewCell {

    //UI
    @IBOutlet weak var lblDateAndTime: UILabel!
    @IBOutlet weak var lblwdescription: UILabel!
    @IBOutlet weak var viewImage: UIImageView!
    @IBOutlet weak var lbltempMax: UILabel!
    @IBOutlet weak var lbltempMin: UILabel!
    @IBOutlet weak var lblwindspeed: UILabel!
    @IBOutlet weak var lblclouds: UILabel!
    //UI
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(data: ForeCast) {
        if !data.icon.characters.isEmpty {
            let imageurl = EndPoints.image + data.icon + ".png"
            viewImage.PR2ImageFromNetwork(imageurl)
        } else {
            viewImage = nil
        }
        let wdate = Date(timeIntervalSince1970: Double(data.dt))
        let weekday = wdate.weekdayName
        
        let datestring = String(format: "%@ %02d:%02d", weekday, wdate.hour, wdate.minute)
        
        lblDateAndTime.text = datestring
        lblwdescription.text = data.wdescription
        lbltempMax.text = String(format: "%0.1fº C", data.tempMax)
        lbltempMin.text = String(format: "%0.1fº C", data.tempMin)
        lblwindspeed.text = String(format: "%0.1f m/s", data.windspeed)
        lblclouds.text = String(format: "clouds: %2d %%", data.clouds)
    }
}
