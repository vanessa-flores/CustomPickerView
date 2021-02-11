//
//  ViewController.swift
//  CustomPickerView
//
//  Created by Vanessa Flores on 2/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI Components
    
    let hoursPickerView = UIPickerView(frame: .zero)
    let minutesPickerView = UIPickerView(frame: .zero)
    let secondsPickerView = UIPickerView(frame: .zero)

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        configurePickerViews()
    }
    
    // MARK: - UI Configuration

    private func configurePickerViews() {
        configureHoursPickerView()
        configureMinutesPickerView()
    }
    
    private func configureHoursPickerView() {
        view.addSubview(hoursPickerView)
        hoursPickerView.translatesAutoresizingMaskIntoConstraints = false
        hoursPickerView.dataSource = self
        hoursPickerView.delegate = self
        
        NSLayoutConstraint.activate([
            hoursPickerView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            hoursPickerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            hoursPickerView.heightAnchor.constraint(equalToConstant: 50),
            hoursPickerView.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    private func configureMinutesPickerView() {
        view.addSubview(minutesPickerView)
        minutesPickerView.translatesAutoresizingMaskIntoConstraints = false
        minutesPickerView.dataSource = self
        minutesPickerView.delegate = self
        
        NSLayoutConstraint.activate([
            minutesPickerView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
//            minutesPickerView.leadingAnchor.constraint(equalTo: )
        ])
    }
    
    private func configureSeparatorLabel(for timeType: TimePicker.TimeType) {
        let label = UILabel()
        label.text = ":"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
//        let leadingConstraint = NSLayoutConstraint(
        
//        NSLayoutConstraint.activate([
//            label.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
//
//        ])
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
