//
//  Cooridnates.swift
//  Alert!
//
//  Created by Abhishek Tiwari on 06/06/20.
//  Copyright © 2020 Abhishek Tiwari. All rights reserved.
//

import Foundation

struct Coordinates{
    var latitude: Double?
    var longitude: Double?
    
    mutating func getCoords(lats: Double, longs: Double){
        latitude = lats
        longitude = longs
    }
}
