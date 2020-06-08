//
//  ContactsViewController.swift
//  Alert!
//
//  Created by Abhishek Tiwari on 07/06/20.
//  Copyright © 2020 Abhishek Tiwari. All rights reserved.
//

import UIKit
import RealmSwift
import SwipeCellKit

class ContactsViewController: UITableViewController, SwipeTableViewCellDelegate {
    
    var realm = try! Realm()
    var contactList: Results<SaveNumber>?
    
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
            guard orientation == .right else { return nil }

        let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
            if let contactsTodelete = self.contactList?[indexPath.row]{
                do{
                    try self.realm.write{
                        self.realm.delete(self.contactList![indexPath.row])
                    }
                }catch{
                    print(error)
                }
            }
        }
        deleteAction.image = UIImage(named: "delete_icon")

        return [deleteAction]
    }
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        return options
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.rowHeight = 60
        loaddata()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList?.count ?? 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SwipeTableViewCell
        cell.delegate = self
        cell.textLabel?.text = contactList?[indexPath.row].name ?? "No name found"
        cell.detailTextLabel?.text = contactList?[indexPath.row].number ?? "No number"
        return cell
    }
    func loaddata(){
        contactList = realm.objects(SaveNumber.self)
    }
    
    

}
