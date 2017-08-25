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
    
    // MARK: - Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let entryTitle = entries[indexPath.row].title
        
        // assign stringEndpoint to it's title, then push the DetailController
        if entryTitle == String(describing: Endpoints.people) {
            if let detailController = storyboard?.instantiateViewController(withIdentifier: "DetailControllerID") as? DetailController {
                detailController.stringEndpoint = String(describing: Endpoints.people)
                navigationController?.pushViewController(detailController, animated: true)
            }
        }
        if entryTitle == String(describing: Endpoints.starships) {
            if let detailController = storyboard?.instantiateViewController(withIdentifier: "DetailControllerID") as? DetailController {
                detailController.stringEndpoint = String(describing: Endpoints.starships)
                navigationController?.pushViewController(detailController, animated: true)
            }
        }
        if entryTitle == String(describing: Endpoints.vehicles) {
            if let detailController = storyboard?.instantiateViewController(withIdentifier: "DetailControllerID") as? DetailController {
                detailController.stringEndpoint = String(describing: Endpoints.vehicles)
                navigationController?.pushViewController(detailController, animated: true)
            }
        }
    }
    
}

