//
//  SwitchTableViewCell.swift
//  Alarm
//
//  Created by Caleb Strong on 7/24/17.
//  Copyright © 2017 Caleb Strong. All rights reserved.
//

import UIKit

protocol SwitchTableViewCellDelegate: class {
    func switchCellSwitchValueChanged(_ cell: SwitchTableViewCell, selected: Bool)
}

class SwitchTableViewCell: UITableViewCell {
    
    // MARK: Internal Properties
    
    weak var delegate: SwitchTableViewCellDelegate?
    
    // MARK: - Outlets
    
    @IBOutlet weak var alarmSwitch: UISwitch!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    // MARK: - Actions
    
    @IBAction func switchValueChanged(_ sender: Any) {
        delegate?.switchCellSwitchValueChanged(self, selected: alarmSwitch.isOn)
    }
    
    func updateViews(alarm: Alarm?) {
        guard let alarm = alarm else { return }
        timeLabel.text = alarm.fireTimeAsString
        nameLabel.text = alarm.name
        alarmSwitch.isOn = alarm.enabled
    }
    
    // MARK: Properties
    
    
    var alarm: Alarm? {
        didSet {
            updateViews(alarm: alarm)
        }
    }
}


