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

class GMapViewController: UIViewController {
    
    //UIView class with Google Maps
    @IBOutlet weak var gMapView: UIView!
    @IBOutlet weak var mapNavBar: UINavigationBar!
    @IBOutlet weak var resultTable: UITableView!
    
    // setting Delegate
    var backSettingDelegate: SetLocation?

    var searchNavBar: UINavigationBar? = nil
    var searchBar: UISearchBar? = nil
    
    var searchTableManager: LocationSearchTable?
    
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
        
        searchTableManager = LocationSearchTable()
        
        //setGMap
        setGMap()
        setSearchBar()
        setResultTableView()
        
    }
    
    func setGMap () {
        let camera = GMSCameraPosition.camera(withLatitude: 37.0, longitude: 126.0, zoom: 10)
        let mapView = GMSMapView.map(withFrame: self.gMapView.bounds, camera: camera)
        
        //틸트 false
        mapView.settings.tiltGestures = false
        
        gMapView.insertSubview(mapView, belowSubview: gMapView.viewWithTag(100)!)
    }
    
    func setSearchBar () {
        
        searchNavBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: gMapView.frame.width, height: 44))
        gMapView.addSubview(searchNavBar!)
        
        searchBar = UISearchBar()
        searchBar?.placeholder = "집 위치를 검색하세요"
        searchBar?.barStyle = .default
        searchBar?.sizeToFit()
        searchBar?.delegate = self
        
        searchNavBar?.setItems([UINavigationItem()], animated: false)
        searchNavBar?.topItem?.titleView = searchBar
    }
    
    func setResultTableView () {
        resultTable.delegate = searchTableManager.self
        resultTable.dataSource = searchTableManager.self
        resultTable.isHidden = true
        
    }
    
    // Saving the home location and content data.
    // TODO: add parameters with label and coordinate info
    func setHome () {
        backSettingDelegate?.setSelectedLocation(valueSent: "test")
    }
}

extension GMapViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
        resultTable.isHidden = false
        
        print("검색")
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        // remove the subview using tag
        searchBar.showsCancelButton = false
        resultTable.isHidden = true
        
        print("종료")
        searchBar.resignFirstResponder()
    }
    
}
