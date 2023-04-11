//
//  ViewController.swift
//  Brandon Weber Homework 6
//
//  Created by Brandon Weber on 4/11/23.
//

import UIKit
import CoreLocation

class DistanceViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var distanceLabel: UILabel!
    
    
    let locationManager: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    // wfc = wells fargo center
    let wfcLatitude: CLLocationDegrees = 39.901333
    let wfcLongitude: CLLocationDegrees = -75.172592
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
       
        
        
        let newLocation: CLLocation=locations[0]
        
        if newLocation.horizontalAccuracy >= 0 {
            let wfc:CLLocation = CLLocation(latitude: wfcLatitude, longitude: wfcLongitude)
            let change: CLLocationDistance = wfc.distance(from: newLocation)
            let miles: Double = (change * 0.0000621371) + 0.5
            if miles < 3 {
                locationManager.stopUpdatingLocation()
                distanceLabel.text = "You Have Arrived!"
            }else {
                let commaFormat: NumberFormatter = NumberFormatter()
                commaFormat.numberStyle = NumberFormatter.Style.decimal
                distanceLabel.text = commaFormat.string(from: NSNumber(value: miles))!+" Miles to the Wells Fargo Center"
            }
            }
        }
       
        
        
        
        
        
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.distanceFilter = 1609;
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        startLocation = nil
    }


}

