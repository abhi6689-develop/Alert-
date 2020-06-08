//
//  Cooridnates.swift
//  Alert!
//
//  Created by Abhishek Tiwari on 06/06/20.
//  Copyright © 2020 Abhishek Tiwari. All rights reserved.
//

import Foundation
import CoreLocation

class Coordinates{
    var latitude: Double?
    var longitude: Double?
    var message = ""
    
    func getCoords(lats: Double, longs: Double){
        latitude = lats
        longitude = longs
    }
    
    func getAddress(lat: Double, lon: Double) -> String{
        let ceo: CLGeocoder = CLGeocoder()
        let loc: CLLocation = CLLocation(latitude:lat, longitude:lon)
        var addressString : String = ""
        ceo.reverseGeocodeLocation(loc, completionHandler:
                {(placemarks, error) in
                    if (error != nil)
                    {
                        print("reverse geodcode fail: \(error!.localizedDescription)")
                    }
                    let pm = placemarks! as [CLPlacemark]

                    if pm.count > 0 {
                        let pm = placemarks![0]
                        if pm.subLocality != nil {
                            addressString = addressString + pm.subLocality! + ", "
                        }
                        if pm.thoroughfare != nil {
                            addressString = addressString + pm.thoroughfare! + ", "
                        }
                        if pm.locality != nil {
                            addressString = addressString + pm.locality! + ", "
                        }
                        if pm.country != nil {
                            addressString = addressString + pm.country! + ", "
                        }
                        if pm.postalCode != nil {
                            addressString = addressString + pm.postalCode! + " "
                            
                        }
                        self.message = addressString
                  }
            })
        return addressString
    }
}
