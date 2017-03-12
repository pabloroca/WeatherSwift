//
//  CitiesViewController.swift
//  WeatherSwift
//
//  Created by Pablo Roca Rozas on 12/3/17.
//  Copyright © 2017 PR2Studio. All rights reserved.
//

import UIKit

class CitiesViewController: UITableViewController {

    //UI
    @IBOutlet var viewTable: UITableView!
    //UI
    
    var arrcities: [Cities] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewTable.dataSource = self
        viewTable.delegate = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        arrcities = CitiesDataController().readAll()
        viewTable.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.title = NSLocalizedString("TitleMain", comment: "")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewcontroller = storyboard.instantiateViewController(withIdentifier: "ForeCastViewController") as! ForeCastViewController
        viewcontroller.selectedCity = arrcities[indexPath.row].cityname
        self.navigationController?.pushViewController(viewcontroller, animated: true)
    }
}
