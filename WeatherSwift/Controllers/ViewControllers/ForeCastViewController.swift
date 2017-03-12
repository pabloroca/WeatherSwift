//
//  ForeCastViewController.swift
//  WeatherSwift
//
//  Created by Pablo Roca Rozas on 12/3/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import UIKit

class ForeCastViewController: UITableViewController {

    //UI
    @IBOutlet var viewTable: UITableView!
    //UI
    
    var selectedCity: String = ""
    var arrForeCast: [ForeCast] = []

    // MARK: - View liveCycle

    override func viewDidLoad() {
        super.viewDidLoad()

        viewTable.delegate = self
        viewTable.dataSource = self
        
        ForeCastNetworkController().readForeCastForCity(self.selectedCity) { (success) in
            self.arrForeCast = ForeCastDataController().readAll()
            self.viewTable.reloadData()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.title = String(format: NSLocalizedString("TitleForeCast", comment: ""), selectedCity)
    }

    // MARK: - Custom Methods
    
}
