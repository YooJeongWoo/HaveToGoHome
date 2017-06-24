//
//  LocationSearchTable.swift
//  HaveToGoHome
//
//  Created by 유정우 on 2017. 6. 24..
//  Copyright © 2017년 prohuhackers. All rights reserved.
//

import Foundation
import UIKit

class LocationSearchTable: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    override init() {
        super.init()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "searchCell")!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
}
