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
        
        NSLayoutConstraint.activate([
            pickerView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            pickerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            pickerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            pickerView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

// MARK: - UIPickerViewDataSource

extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return TimePicker.timeValues(for: .hours).count
        case 1:
            return TimePicker.timeValues(for: .minutes).count
        case 2: return TimePicker.timeValues(for: .seconds).count
        default:
            return 0
        }
    }
    
}
