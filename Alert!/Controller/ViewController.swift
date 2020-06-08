//
//  ViewController.swift
//  HaventDecidedYet
//
//  Created by Abhishek Tiwari on 05/06/20.
//  Copyright © 2020 Abhishek Tiwari. All rights reserved.
//

import UIKit
import CoreLocation
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate{
    
    
    @IBOutlet weak var addPeople: UIBarButtonItem!
    @IBOutlet weak var sosButton: UIButton!
    var sendmessage = SendMessage()
    let locationManager = CLLocationManager()
    var coordinates = Coordinates()
    
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sosButton.layer.cornerRadius = sosButton.frame.height / 2
    }
    
    func messageInterface(){
        if let latitude = coordinates.latitude, let longitude = coordinates.longitude{
            sendmessage.getNums()
            let composeVC = MFMessageComposeViewController()
            composeVC.messageComposeDelegate = self
            composeVC.recipients = sendmessage.numbers
            composeVC.body = "Help! I'm in danger, my location - latitude: \(latitude), longitude: \(longitude), Address: \(coordinates.message)"
            print("Help! I'm in danger, my location - latitude: \(latitude), longitude: \(longitude), Address: \(coordinates.message)")
            if MFMessageComposeViewController.canSendText(){
                self.present(composeVC, animated: true, completion: nil)
            }else{
                print("Can't send messages from your phone")
            }
        }
    }


    
    
    @IBAction func sosButtonPressed(_ sender: Any) {
        locationManager.requestLocation()
        self.messageInterface()
    }
}
extension ViewController: CLLocationManagerDelegate{
    
    internal func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            locationManager.startUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            locationManager.stopUpdatingLocation()
            coordinates.getCoords(lats: lat, longs: lon)
            coordinates.getAddress(lat: lat, lon: lon)
            
            
            
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}

