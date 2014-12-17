//
//  ViewController.swift
//  iOS8_iBeaconSwiftTest01
//
//  Created by tikomo on 2014/12/17.
//  Copyright (c) 2014年 tikomo. All rights reserved.
//

import UIKit

import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {

    let proximityUUID = NSUUID(UUIDString:"C768FFC6-B7C4-4079-8EC7-9094AAA19782")
    var beaconRegion = CLBeaconRegion()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        beaconRegion = CLBeaconRegion(proximityUUID:proximityUUID,identifier:"MyBeacon")

        locationManager.delegate = self
        
        locationManager.requestAlwaysAuthorization()
        
        locationManager.startRangingBeaconsInRegion(self.beaconRegion)
    }
    
    func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: NSArray!, inRegion region: CLBeaconRegion!) {
        
        
        if(beacons.count >= 1) {
 
            var beacon = beacons.firstObject as CLBeacon
            
            println(beacon.proximityUUID.UUIDString)
            println(beacon.major)
            println(beacon.minor)
            println(beacon.accuracy)
            println(beacon.rssi)
            
            switch (beacon.proximity) {
            case CLProximity.Unknown :
                println("Unknown Proximity")
                break
            case CLProximity.Immediate :
                println("Unknown Immediate")
                break
            case CLProximity.Near :
                println("Unknown Near")
                break
            case CLProximity.Far :
                println("Unknown Far")
                break
            default :
                break;
            }
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

