//
//  EntryTableViewController.swift
//  AssessmentPreview
//
//  Created by Michael De La Cruz on 8/21/17.
//  Copyright © 2017 Michael De La Cruz. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveJSON

class EntryPointTableViewController: UITableViewController {
    
    // MARK: - Properties
    fileprivate var entries = [Entity]()
    fileprivate var identifier = "Cell"
    fileprivate var entryModel: EntryModel? {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "StarWars"
        tableView.register(EntryPointCell.self, forCellReuseIdentifier: identifier)
        self.view.backgroundColor = .black
        
        entryModel = EntryModel()
        entries = (entryModel?.start())!
    }
    
    // MARK: - TableView methods
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (self.view.frame.height / CGFloat(entries.count))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        if let cell = cell as? EntryPointCell {
            cell.selectionStyle = .none
            cell.configure(img: entries[indexPath.row].img)
        }
        return cell
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let peopleDestination = self.storyboard?.instantiateViewController(withIdentifier: "PeopleControllerID") as? PeopleController else { fatalError("Could not find PeopleController")
        }
        guard let starshipDestination = self.storyboard?.instantiateViewController(withIdentifier: "StarshipControllerID") as? StarshipController else { fatalError("Could not find StarshipController")
        }
        guard let vehicleDestination = self.storyboard?.instantiateViewController(withIdentifier: "VehicleControllerID") as? VehicleController else { fatalError("Could not find VehicleController")
        }
        
        if entries[indexPath.row].title == String(describing: Endpoints.people) {
            self.navigationController?.pushViewController(peopleDestination, animated: true)
        }
        if entries[indexPath.row].title == String(describing: Endpoints.starships) {
            self.navigationController?.pushViewController(starshipDestination, animated: true)
        }
        if entries[indexPath.row].title == String(describing: Endpoints.vehicles) {
            self.navigationController?.pushViewController(vehicleDestination, animated: true)
        }
    }
    
}
