//
//  AddPeopleViewController.swift
//  HaventDecidedYet
//
//  Created by Abhishek Tiwari on 06/06/20.
//  Copyright © 2020 Abhishek Tiwari. All rights reserved.
//

import UIKit
import RealmSwift

class AddPeopleViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    let realm = try! Realm()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addButton.layer.cornerRadius = 30
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupHideKeyboardOnTap()

    }
    @IBAction func AddButtonPressed(_ sender: Any) {
        if let name = self.nameField.text, let number = self.phoneField.text{
            do{
                try self.realm.write{
                    let newContact = SaveNumber()
                    newContact.name = name
                    newContact.number = number
                    realm.add(newContact)
                }
            }catch{
                print(error)
            }
        }
        nameField.text = ""
        phoneField.text = ""
        let alertController = UIAlertController(title: title, message: "New contact added", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    func setupHideKeyboardOnTap() {
        self.view.addGestureRecognizer(self.endEditingRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(self.endEditingRecognizer())
    }
    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
}
