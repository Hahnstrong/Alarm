//
//  AlarmController.swift
//  Alarm
//
//  Created by Caleb Strong on 7/24/17.
//  Copyright © 2017 Caleb Strong. All rights reserved.
//

import Foundation

class AlarmController {
    
    static let shared = AlarmController()
    
    var alarms: [Alarm] = []
    
// MARKS: - Create
    
    func addAlarm(fireTimeFromMidnight: TimeInterval, name: String) {
        let alarm = Alarm(fireTimeFromMidnight: fireTimeFromMidnight, name: name)
        
        self.alarms.append(alarm)
    }
    
// MARKS: - Update
    
    func update(alarm: Alarm, fireTimeFromMidnight: TimeInterval, name: String) {
        guard let index = alarms.index(of: alarm) else { return }
        alarms[index].fireTimeFromMidnight = fireTimeFromMidnight
        alarms[index].name = name
    }
    
    func toggleEnabled(for alarm: Alarm) {
        alarm.enabled = !alarm.enabled
    }
    
// MARKS: - Delete
    
    func delete(alarm: Alarm) {
        guard let index = alarms.index(of: alarm) else { return }
        alarms.remove(at: index)
    }
    
}
