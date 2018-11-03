//
//  ViewController.swift
//  FilterTableViewWithButton
//
//  Created by G R-Titko on 10/30/18.
//  Copyright © 2018 GRT-Programs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mineralTableView: UITableView!
    
    var currentFilter: String = "" {
        didSet {
            mineralTableView.reloadData()
        }
    }
    var minerals: [MineralModel] = []
    //var filteredMinerals: [MineralModel] = []
    var isFiltering = false
    
    var filterButtonCounter = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        minerals = MineralModel.populateMinerals()
    }

    var filteredMineral: [MineralModel] {
        if currentFilter == "animal" {
            return minerals.filter({ (mineral) -> Bool in
                return mineral.mineralType == "animal"
            })
        }
        if currentFilter == "mineral" {
            return minerals.filter({ (mineral) -> Bool in
                return mineral.mineralType == "mineral"
            })
        }
        if currentFilter == "thing" {
            return minerals.filter({ (mineral) -> Bool in
                return mineral.mineralType == "thing"
            })
        }
        return minerals
    }
    
    @IBAction func filterButtonPressed(_ sender: UIBarButtonItem) {
        filterButtonCounter += 1
        switch filterButtonCounter {
        case 1:
            sender.title = "All"
            isFiltering = false
            currentFilter = "All"
        case 2:
            sender.title = "Animal"
            isFiltering = true
            currentFilter = "animal"
//            for item in minerals {
//                if item.mineralType == currentFilter {
//                    filteredMinerals.append(item)
//                }
//            }
//            minerals = filteredMinerals
        case 3:
            sender.title = "Mineral"
            isFiltering = true
            currentFilter = "mineral"
//            for item in minerals {
//                if item.mineralType == currentFilter {
//                    filteredMinerals.append(item)
//                }
//            }
//            minerals = filteredMinerals
        case 4:
            sender.title = "Thing"
            isFiltering = true
            currentFilter = "thing"
//            for item in minerals {
//                if item.mineralType == currentFilter {
//                    filteredMinerals.append(item)
//                }
//            }
//            minerals = filteredMinerals
            filterButtonCounter = 0
        default:
            print("No other options exist")
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        if isFiltering {
        //            print("Filtered count: \(filteredResults.count)")
        //            return filteredResults.count
        //        } else {
        //            print("Requests count: \(requests.count)")
        //            return requests.count
        //        }
        NSLog("FILTERING Cell count: %lld; filter: %@", filteredMineral.count, currentFilter)
        return filteredMineral.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MineralCell", for: indexPath) as! MineralTableViewCell
        
        NSLog("FILTERING Requesting cell: %lld, %lld; filter: %@", indexPath.section, indexPath.row, currentFilter)
        let mineral = filteredMineral[indexPath.row]
        
        //        if isFiltering {
        //            request =  filteredResults[indexPath.row]
        //        } else {
        //            request = requests[indexPath.row]
        //        }
        
//        mineral = minerals[indexPath.row]
        //let request = filteredResults[indexPath.row]
        cell.leftImage.image = mineral.mainImage
        cell.labelType.text = mineral.mineralType
        return cell
    }
    
}


