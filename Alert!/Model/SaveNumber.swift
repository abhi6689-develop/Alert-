//
//  SaveNumber.swift
//  HaventDecidedYet
//
//  Created by Abhishek Tiwari on 06/06/20.
//  Copyright © 2020 Abhishek Tiwari. All rights reserved.
//

import Foundation
import RealmSwift

class SaveNumber: Object{
    @objc dynamic var name: String = ""
    @objc dynamic var number: String = ""
}
