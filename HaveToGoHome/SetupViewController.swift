//
//  SetupViewController.swift
//  HaveToGoHome
//
//  Created by 유정우 on 2017. 6. 19..
//  Copyright © 2017년 prohuhackers. All rights reserved.
//

import UIKit

// Code for SetupView
enum SetupCase: Int {
    //basic setting with first setting
    case basicSetting
    //advanced setting with other features
    case advancedSetting
}

class SetupViewController: UIViewController {
    
    @IBOutlet weak var setupNavBar: UINavigationBar!
    @IBOutlet weak var setupTableView: UITableView!
    
    var timePicker: UIDatePicker?
    
    //Model entitiy for items
    var setupModel: SetupModel!
    
    // cell array for cell type
    var mainSettingCells = [MainSettingComponent]()
    var datePickerSettingCells = [DatePickerSettingComponent]()
    var switchSettingCells = [SwitchSettingComponent]()
    
    var viewCase: SetupCase = .basicSetting
    var isSetDone: Bool = false
    
    // userSetting Item
    var userHome: String?
    var limitTime: String?
    var beforeAlarm: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupModel = SetupModel()
        //Loading cells' info
        loadMainSettingCells()
        loadUserData()
        
        //Transparent navigation bar
        setupNavBar.setBackgroundImage(UIImage(), for: .default)
        setupNavBar.shadowImage = UIImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Update the setup table view cells
        loadUserData()
        setupTableView.reloadData()
    }
    
    // 집 위치 설정
    func goToMapSetting() {
        let gMapViewController = self.storyboard?.instantiateViewController(withIdentifier: "GMapViewController")  as! GMapViewController
        gMapViewController.backSettingDelegate = self
        
        self.present(gMapViewController, animated: true, completion: nil)
    }
    
    // 통금 시간 설정
    func goLimitTimeSetting() {
        
        self.reloadInputViews()
    }
    
    // Load Setting Cells
    func loadMainSettingCells () {
        // 집 위치 설정 cell
        mainSettingCells.append(MainSettingComponent(title: "집 위치 설정", content: "집 위치를 설정하세요", image: "placeholder", show: true))
        // 통금 시간 설정 cell
        datePickerSettingCells.append(DatePickerSettingComponent(title: "통금 시간 설정", content: "", image: "clock", show: true))
        // 승하차 전 푸시알림 설정 cell
        switchSettingCells.append(SwitchSettingComponent(title: "승/하차 전 푸시알림", value: true, show: true))
    }
    
    //Reload User Data
    func loadUserData() {
        if setupModel.isUserHomeSet() {
            let entity = setupModel.getUserHomeEntity()
            
            if setupModel.isUserHomeSet() {
                mainSettingCells[0].content = entity?.homeLocationLabel
            }
            if setupModel.isLimitTimeSet() {
                datePickerSettingCells[0].content = entity?.limitTime
            }
            if setupModel.isOnOffAlarmSet() {
                switchSettingCells[0].value = (entity?.onOffAlarmOption)!
            }
        }
        
        isSetDone = setupModel.isAllSet()
    }
    
    // 화면 터치하면 textField 수정 끝
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.setupTableView.endEditing(true)
    }
}



extension SetupViewController: UITableViewDataSource, UITableViewDelegate {
    
    //Cell for row at
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = createSettingCellsWithCode(tableView, setupCase: viewCase, indexPath: indexPath)
        return cell
    }
    
    //Number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch viewCase {
        case .basicSetting:
            return 4
        case .advancedSetting:
            return 2
        }
    }
    
    // Set Cell Height for setting cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch viewCase {
        case .basicSetting:
            if(indexPath.row < 2) {
                return 117.0
            } else if(indexPath.row == indexPath.endIndex + 1) {
                return 150
            } else {
                return 60
            }
        case .advancedSetting:
            return 0.0
        }
    }
    
    // Create Setting Component cell with indexPath and setupCase
    func createSettingCellsWithCode(_ tableView: UITableView, setupCase:SetupCase, indexPath: IndexPath) -> UITableViewCell {
        // Setting for home and limit time
        if(indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeSettingCell", for: indexPath) as! SetupTableViewCell
            let component: MainSettingComponent = mainSettingCells[indexPath.row]
            
            cell.settingTitle.text = component.title!
            cell.settingContent.text = component.content!
            cell.settingImage.image = UIImage(named: component.image!)
            
            // Add tap gesture to content button
            let gestureRecognizer: UITapGestureRecognizer
            gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(goToMapSetting))
            
            cell.settingContent.addGestureRecognizer(gestureRecognizer)
            
            return cell
            //Setting for time limit setting
        } else if (indexPath.row == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TimeSettingCell", for: indexPath) as! TimeSetupTableViewCell
            let component: DatePickerSettingComponent = datePickerSettingCells[indexPath.row - 1]
            
            cell.settingTitle.text = component.title!
            cell.settingTextField.text = component.content!
            cell.settingImage.image = UIImage(named: component.image!)
            
            cell.updateDelegate = self
            
            cell.addToolBar()
            
            return cell
            //Setting for Progress Button
        } else if (indexPath.row == indexPath.endIndex + 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NextButtonCell", for: indexPath) as! ProgressButtonTableViewCell
            
            // initially set it disabled
            cell.progressButton.setTitle("완료", for: .normal)
            cell.progressButton.setTitleColor(UIColor.gray, for: .normal)
            cell.progressButton.isEnabled = isSetDone
            
            return cell
            //Setting switch setting cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchSettingCell", for: indexPath) as! SwitchSetupTableViewCell
            let component: SwitchSettingComponent = switchSettingCells[indexPath.row - 2]
            
            cell.settingTitle.text = component.title!
            cell.settingSwitch.setOn(component.value, animated: false)
            
            return cell
        }
    }

    
}


extension SetupViewController: SetLocation {
    
    // Protocol function from GMapViewController
    // TODO: change the sent data to right one
    func setSelectedLocation(valueSent: String) {
        setupModel.setUserHomeLocation(locationLabel: valueSent, locationDetail: valueSent, locationData: nil)
        self.userHome = setupModel.getUserHomeEntity()?.homeLocationLabel
    }

}


extension SetupViewController: NotifySetupViewDelegate {
    // Protocol function from SetupTableViewCells
    func updateSetupView() {
        isSetDone = setupModel.isAllSet()
        
        loadUserData()
        setupTableView.reloadData()
    }
}
