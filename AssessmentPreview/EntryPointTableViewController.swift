//
//  EntryTableViewController.swift
//  AssessmentPreview
//
//  Created by Michael De La Cruz on 8/21/17.
//  Copyright © 2017 Michael De La Cruz. All rights reserved.
//

import UIKit

class EntryTableViewController: UITableViewController {
    
//    fileprivate var identifier = "Cell"
//    fileprivate var entryItem: EntryItem? {
//        didSet {
//            DispatchQueue.main.async { [weak self] in
//                self?.tableView.reloadData()
//            }
//        }
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//        self.title = "StarWars"
//        tableView.register(EntryPointCell.self, forCellReuseIdentifier: identifier)
//        self.view.backgroundColor = .black
//        
//        entryModel = EntryModel()
//        entries = (entryModel?.start())!
//    }
//    
//    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
//    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return (self.view.frame.height / CGFloat(entries.count))
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return entries.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
//        
//        if let cell = cell as? EntryPointCell {
//            cell.selectionStyle = .none
//            cell.configure(img: entries[indexPath.row].img)
//        }
//        
//        return cell
//    }
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        guard let destination = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewControllerID")
//            as? DetailViewController else { fatalError("Could not find DetailViewController")
//        }
//        
//        // TODO: send data to right form of DetailViewController
//        if entries[indexPath.row].title == String(describing: Type.characters) {
//            self.navigationController?.pushViewController(destination, animated: true)
//        }
//    }

}
