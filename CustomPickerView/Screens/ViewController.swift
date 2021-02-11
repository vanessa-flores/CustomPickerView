//
//  ViewController.swift
//  CustomPickerView
//
//  Created by Vanessa Flores on 2/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    enum Separator {
        case first, second
    }
    
    // MARK: - UI Components
    
    let hoursPickerView = UIPickerView(frame: .zero)
    let minutesPickerView = UIPickerView(frame: .zero)
    let secondsPickerView = UIPickerView(frame: .zero)
    let firstSeparator = SeparatorLabel(frame: .zero)
    let secondSeparator = SeparatorLabel(frame: .zero)
    
    // MARK: - Properties
    
    let separatorPadding: CGFloat = 2
    let pickerViewWidth: CGFloat = 60
    let pickerViewHeight: CGFloat = 50

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configurePickerViews()
    }
    
    // MARK: - UI Configuration

    private func configurePickerViews() {
        configure(minutesPickerView)
        configure(separator: .first)
        configure(hoursPickerView)
        configure(separator: .second)
        configure(secondsPickerView)
    }
    
    private func configure(_ pickerView: UIPickerView) {
        setupPickerView(pickerView)
        
        NSLayoutConstraint.activate([
            pickerView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            pickerView.heightAnchor.constraint(equalToConstant: pickerViewHeight),
            pickerView.widthAnchor.constraint(equalToConstant: pickerViewWidth)
        ])
        
        switch pickerView {
        case hoursPickerView:
            pickerView.trailingAnchor.constraint(equalTo: firstSeparator.leadingAnchor, constant: -separatorPadding).isActive = true
        case minutesPickerView:
            pickerView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        case secondsPickerView:
            pickerView.leadingAnchor.constraint(equalTo: secondSeparator.trailingAnchor, constant: separatorPadding).isActive = true
        default:
            break
        }
    }
    
    private func configure(separator: Separator) {
        let separatorLabel: SeparatorLabel
        
        switch separator {
        case .first:
            separatorLabel = firstSeparator
            view.addSubview(firstSeparator)
            separatorLabel.trailingAnchor.constraint(equalTo: minutesPickerView.leadingAnchor, constant: -separatorPadding).isActive = true
        case .second:
            separatorLabel = secondSeparator
            view.addSubview(secondSeparator)
            separatorLabel.leadingAnchor.constraint(equalTo: minutesPickerView.trailingAnchor, constant: separatorPadding).isActive = true
        }
        
        NSLayoutConstraint.activate([
            separatorLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            separatorLabel.widthAnchor.constraint(equalToConstant: 4),
        ])
    }
    
    // MARK: - Helpers
    
    private func setupPickerView(_ pickerView: UIPickerView) {
        view.addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.dataSource = self
        pickerView.delegate = self
    }
}

// MARK: - UIPickerViewDataSource

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: - Data Source
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch pickerView {
        case hoursPickerView:
            return TimePicker.timeValues(for: .hours).count
        case minutesPickerView:
            return TimePicker.timeValues(for: .minutes).count
        case secondsPickerView:
            return TimePicker.timeValues(for: .seconds).count
        default:
            return 0
        }
    }
    
    // MARK: - Delegate
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 70
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case hoursPickerView:
            return String(TimePicker.timeValues(for: .hours)[row])
        case minutesPickerView:
            return String(TimePicker.timeValues(for: .minutes)[row])
        case secondsPickerView:
            return String(TimePicker.timeValues(for: .seconds)[row])
        default:
            return ""
        }
    }
    
}
