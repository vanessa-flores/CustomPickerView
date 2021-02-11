//
//  ViewController.swift
//  CustomPickerView
//
//  Created by Vanessa Flores on 2/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Components
    
    let pickerView = UIPickerView(frame: .zero)

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configurePickerView()
    }
    
    // MARK: - UI Configuration

    private func configurePickerView() {
        view.addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.dataSource = self
        pickerView.delegate = self
        
        NSLayoutConstraint.activate([
            pickerView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            pickerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            pickerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            pickerView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: - UIPickerViewDataSource

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: - Data Source
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return TimePicker.timeValues(for: .hours).count
        case 1:
            return TimePicker.timeValues(for: .minutes).count
        case 2:
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
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        switch component {
        case 0:
            let value = String(TimePicker.timeValues(for: .hours)[row])
            let view = TimePickerRowView(value: value, timeType: .hours)
            return view
        case 1:
            let value = String(TimePicker.timeValues(for: .minutes)[row])
            let view = TimePickerRowView(value: value, timeType: .minutes)
            return view
        case 2:
            let value = String(TimePicker.timeValues(for: .seconds)[row])
            let view = TimePickerRowView(value: value, timeType: .seconds)
            return view
        default:
            let label = UILabel()
            label.text = ""
            
            return label
        }
    }
    
}
