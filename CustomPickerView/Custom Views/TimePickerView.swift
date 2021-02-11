//
//  TimePickerView.swift
//  CustomPickerView
//
//  Created by Vanessa Flores on 2/11/21.
//

import UIKit

class TimePickerView: UIPickerView {
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Configuration
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
    }
}

