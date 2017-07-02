//
//  SetupTableViewCell.swift
//  HaveToGoHome
//
//  Created by 유정우 on 2017. 6. 20..
//  Copyright © 2017년 prohuhackers. All rights reserved.
//

import UIKit

// Setting table cell component
struct MainSettingComponent {
    var title:String?
    var content:String?
    var image:String?
    var show:Bool
    
    init(title:String, content:String, image:String, show:Bool) {
        self.title = title
        self.content = content
        self.image = image
        self.show = show
    }
}

// Datepicker cell component
struct DatePickerSettingComponent {
    var title:String?
    var content:String?
    var image:String?
    var show:Bool
    
    init(title:String, content:String, image:String, show:Bool) {
        self.title = title
        self.content = content
        self.image = image
        self.show = show
    }

}

// Switch setting cell component
struct SwitchSettingComponent {
    var title:String?
    var value:Bool
    var show:Bool
    
    init(title:String, value:Bool, show:Bool) {
        self.title = title
        self.value = value
        self.show = show
    }
}

protocol NotifySetupViewDelegate {
    func updateSetupView ()
}

// SetupTableViewCell - with content
class SetupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var settingTitle: UILabel!
    @IBOutlet weak var settingContent: InsetLabel!
    @IBOutlet weak var settingImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//TimeSettingCell
class TimeSetupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var settingTitle: UILabel!
    @IBOutlet weak var settingTextField: UITextField!
    @IBOutlet weak var settingImage: UIImageView!
    
    var datePicker: UIDatePicker?
    var setupModel: SetupModel?
    
    var updateDelegate: NotifySetupViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: settingTextField.frame.height))
        settingTextField.leftView = padding
        settingTextField.leftViewMode = .always
        setupModel = SetupModel()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func popingDatePicker(_ sender: UITextField) {
        addTimePicker(sender)
    }
    
        //add Datepicker with toolbar
    func addTimePicker (_ sender: UITextField) {
        if datePicker == nil {
            datePicker = UIDatePicker()
            datePicker?.datePickerMode = .time
            datePicker?.minuteInterval = 10
            datePicker?.backgroundColor = UIColor.white
            
            datePicker?.addTarget(self, action: #selector(updateCell(sender:)), for: .valueChanged)
        }
        
        settingTextField.inputView = datePicker
    }
    
    //Adding toolbar
    //통금 없음과 완료
    func addToolBar (){
        let toolBar = UIToolbar()
        toolBar.isTranslucent = true
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        let noLimitTimeBtn = UIBarButtonItem(title: "통금 없음", style: .done, target: self, action: #selector(noLimitTimeSet))
        let doneBtn = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(donePressed))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        toolBar.setItems([noLimitTimeBtn,flexSpace,doneBtn], animated: true)
        
        settingTextField.inputAccessoryView = toolBar
    }
    
    // 통금 시간 없음 버튼
    func noLimitTimeSet () {
        settingTextField.text = "통금 시간 없음"
        settingTextField.resignFirstResponder()
    }
    
    // 완료 버튼
    func donePressed () {
        setupModel?.setUserLimitTime(limitTimeData: settingTextField.text)
        updateDelegate?.updateSetupView()
        
        settingTextField.resignFirstResponder()
    }
    
    func updateCell (sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH시 mm분"
        settingTextField.text = dateFormatter.string(from: sender.date)
    }
}

// SwitchSetupTableViewCell - with switch
class SwitchSetupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var settingTitle: UILabel!
    @IBOutlet weak var settingSwitch: UISwitch!
    
    var setupModel: SetupModel?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupModel = SetupModel()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        setupModel?.setOnOffAlarmOption(with: sender.isOn)
    }
}

// SetupView progress button
class ProgressButtonTableViewCell: UITableViewCell {
    
    var setupDoneDelegate: SetupDoneProtocol!
    
    @IBOutlet weak var progressButton: UIButton!
    @IBAction func progressButtonClicked(_ sender: Any) {
        setupDoneDelegate.setupDone()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

protocol SetupDoneProtocol {
    func setupDone ()
}
