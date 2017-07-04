//
//  SetupModel.swift
//  HaveToGoHome
//
//  Created by 유정우 on 2017. 6. 19..
//  Copyright © 2017년 prohuhackers. All rights reserved.
//

import UIKit
import CoreData

class SetupModel: NSObject {

    // Managed Object Context
    var managedObjectContext: NSManagedObjectContext!
    // Setup item
    var homeItem: UserHomeSetting?
    
    //Initialize and load the items
    override init() {
        super.init()
        
        managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        setItems()
    }
    
    //MARK:- Create HomeSetting Entity with label and location data
    func createUserHomeEntity (_ label:String?, locationDetail:String?, locationData:NSData?, limitTimeData: String?, alarmOption: Bool?) {
        
        if isUserHomeSet() {
            return
        }
        
        // Entity item
        let settingItem = UserHomeSetting(context: managedObjectContext)
        
        //Setting attributes
        settingItem.homeLocationLabel = label
        settingItem.homeLocationDetail = locationDetail
        settingItem.homeLocationData = locationData
        settingItem.limitTime = limitTimeData
        if alarmOption != nil {
            settingItem.onOffAlarmOption = alarmOption!
        } else {
            settingItem.onOffAlarmOption = true
        }
        
        //Save
        saveWithContext(context: managedObjectContext)
        
        homeItem = settingItem
    }
    
    // save with context
    func saveWithContext (context: NSManagedObjectContext) {
        do {
            try managedObjectContext.save()
        } catch {
            print("not save data \(error.localizedDescription)")
        }
    }
    
    // MARK: - getter entitiy
    // get home setting entity
    func getUserHomeEntity () -> UserHomeSetting? {
        var resultItem:UserHomeSetting? = nil
        
        let userHomeSettingFetch = NSFetchRequest<UserHomeSetting>(entityName: "UserHomeSetting")
        do {
            let fetchedObject = try managedObjectContext.fetch(userHomeSettingFetch)
            if !fetchedObject.isEmpty && fetchedObject[0].homeLocationLabel != nil {
                resultItem = fetchedObject[0]
                if fetchedObject.count > 1 {
                    print("more than one object for home setting")
                }
            }
        } catch {
            let fetchError = error as NSError
            print(fetchError)
        }
        
        return resultItem
    }
    
    // Set home location data
    func setUserHomeLocation(locationLabel:String?, locationDetail:String?, locationData:NSData?) {
        if let item = getUserHomeEntity() {
            item.homeLocationLabel = locationLabel
            item.homeLocationData = locationData
            
            print("set home location with date \(locationLabel) and \(locationData)")
            
            saveWithContext(context: managedObjectContext)
        } else {
            createUserHomeEntity(locationLabel, locationDetail: locationDetail, locationData: locationData, limitTimeData: nil, alarmOption: nil)
            print(locationLabel)
            print("create New user home entity")
        }
    }
    
    // Set user limit time
    func setUserLimitTime(limitTimeData: String?) {
        if let item = getUserHomeEntity() {
            item.limitTime = limitTimeData
            
            saveWithContext(context: managedObjectContext)
        } else {
            createUserHomeEntity(nil, locationDetail: nil, locationData: nil, limitTimeData: limitTimeData, alarmOption: nil)
        }
        
    }
    
    func setOnOffAlarmOption(with option: Bool) {
        if let item = getUserHomeEntity() {
            item.onOffAlarmOption = option
            
            saveWithContext(context: managedObjectContext)
        } else {
            createUserHomeEntity(nil, locationDetail: nil, locationData: nil, limitTimeData: nil, alarmOption: option)
        }
    }
    
    // MARK:- reload the class items
    // TODO: check the entity has just one item and if not set it to nil
    func setItems () {
        homeItem = getUserHomeEntity()
    }
    
    //MARK: check if it's set
    func isUserHomeSet() -> Bool {
        if getUserHomeEntity() != nil {
            return true
        } else {
            return false
        }
    }
    
    func isUserHomeLocationSet() -> Bool {
        return isUserHomeSet() && homeItem?.homeLocationLabel != nil
    }
    
    func isLimitTimeSet() -> Bool {
        return isUserHomeSet() && homeItem?.limitTime != nil
    }
    
    func isOnOffAlarmSet() -> Bool {
        return isUserHomeSet() && homeItem?.onOffAlarmOption != nil
    }
    
    func isAllSet() -> Bool {
        return isLimitTimeSet() && isUserHomeSet()
    }
    
    
}
