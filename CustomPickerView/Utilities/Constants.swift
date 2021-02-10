//
//  Constants.swift
//  CustomPickerView
//
//  Created by Vanessa Flores on 2/10/21.
//

import Foundation

struct TimePicker {
    
    enum TimeType: String {
        case hours = "hour"
        case minutes = "min"
        case seconds = "sec"
    }
    
    static func timeValues(for timeType: TimeType) -> [Int] {
        var timeValues: [Int] = []
        var upperBound = 0
        
        switch timeType {
        case .hours:
            upperBound = 23
        case .minutes, .seconds:
            upperBound = 59
        }
        
        for timeVaue in 0...upperBound { timeValues.append(timeVaue) }
        
        return timeValues
    }
    
}
