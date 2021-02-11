//
//  TimePickerRowView.swift
//  CustomPickerView
//
//  Created by Vanessa Flores on 2/11/21.
//

import UIKit

class TimePickerRowView: UIView {
    
    // MARK: - UI Components
    
    let valueLabel = UILabel(frame: .zero)
    let separatorLabel = UILabel(frame: .zero)
    
    // MARK: - Properties
    
    var value: String
    var timeType: TimePicker.TimeType
    
    // MARK: - Lifecycle
    
    init(value: String, timeType: TimePicker.TimeType) {
        self.value = value
        self.timeType = timeType
        
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Configuration
    
    private func configure() {
        configureValueLabel()
        
        if timeType == .hours || timeType == .minutes {
            configureSeparatorLabel()
        }
    }
    
    private func configureValueLabel() {
        addSubview(valueLabel)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.text = value
        valueLabel.textAlignment = .center
        
        let width: CGFloat = timeType == .seconds ? 70 : 62
        
        NSLayoutConstraint.activate([
            valueLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            valueLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            valueLabel.widthAnchor.constraint(equalToConstant: width)
        ])
    }
    
    private func configureSeparatorLabel() {
        addSubview(separatorLabel)
        separatorLabel.translatesAutoresizingMaskIntoConstraints = false
        separatorLabel.text = ":"
        
        NSLayoutConstraint.activate([
            separatorLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            separatorLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            separatorLabel.leadingAnchor.constraint(equalTo: valueLabel.trailingAnchor),
            separatorLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
}
