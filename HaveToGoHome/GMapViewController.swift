//
//  GMapViewController.swift
//  HaveToGoHome
//
//  Created by 유정우 on 2017. 6. 21..
//  Copyright © 2017년 prohuhackers. All rights reserved.
//


// protocol for passing data to SetupViewController
protocol SetLocation {
    func setSelectedLocation (valueSent: String)
}

import UIKit
import GoogleMaps

class GMapViewController: UIViewController, UISearchBarDelegate {
    
    //UIView class with Google Maps
    @IBOutlet weak var gMapView: UIView!
    @IBOutlet weak var mapNavBar: UINavigationBar!
    
    var backSettingDelegate: SetLocation?
    
    @IBAction func goBackToSetting(_ sender: Any) {
        // send data back to setting view controller
        setHome()
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Transparent navigation bar
        mapNavBar.setBackgroundImage(UIImage(), for: .default)
        mapNavBar.shadowImage = UIImage()
        
        //setGMap
        setGMap()
    }
    
    func setGMap () {
        let camera = GMSCameraPosition.camera(withLatitude: 37.621262, longitude: -122.378945, zoom: 10)
        let mapView = GMSMapView.map(withFrame: self.gMapView.bounds, camera: camera)
        
        //틸트 false
        mapView.settings.tiltGestures = false
        
        gMapView.addSubview(mapView)
    }
    
    // Saving the home location and content data.
    // TODO: add parameters with label and coordinate info
    func setHome () {
        backSettingDelegate?.setSelectedLocation(valueSent: "test")
    }
}
