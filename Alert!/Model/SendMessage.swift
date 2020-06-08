//
//  SendMessage.swift
//  HaventDecidedYet
//
//  Created by Abhishek Tiwari on 06/06/20.
//  Copyright © 2020 Abhishek Tiwari. All rights reserved.
//

import Foundation
import RealmSwift

class SendMessage{
    var contacts: Results<SaveNumber>?
    var realm = try! Realm()
    var numbers = Array<String>()
    
    func getNums(){
        contacts = realm.objects(SaveNumber.self)
        if let nums = contacts{
            if nums.count != 0{
                for i in Range(0...nums.count-1){
                    numbers.append(nums[i].number)
                }
            }
        }else{
            print("Add a contact first")
        }
    }
}


