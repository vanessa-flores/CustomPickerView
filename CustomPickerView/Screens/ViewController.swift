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
        configureHoursPickerView()
        configureSeparator(isFirst: true)
        configureMinutesPickerView()
        configureSeparator(isFirst: false)
        configureSecondsPickerView()
    }
    
    private func configureHoursPickerView() {
        setupPickerView(hoursPickerView)
        
        NSLayoutConstraint.activate([
            hoursPickerView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            hoursPickerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            hoursPickerView.heightAnchor.constraint(equalToConstant: pickerViewHeight),
            hoursPickerView.widthAnchor.constraint(equalToConstant: pickerViewWidth)
        ])
    }
    
    private func configureMinutesPickerView() {
        setupPickerView(minutesPickerView)
        
        NSLayoutConstraint.activate([
            minutesPickerView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            minutesPickerView.leadingAnchor.constraint(equalTo: firstSeparator.trailingAnchor, constant: separatorPadding),
            minutesPickerView.heightAnchor.constraint(equalToConstant: pickerViewHeight),
            minutesPickerView.widthAnchor.constraint(equalToConstant: pickerViewWidth)
        ])
    }
    
    private func configureSecondsPickerView() {
        setupPickerView(secondsPickerView)
        
        NSLayoutConstraint.activate([
            secondsPickerView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            secondsPickerView.leadingAnchor.constraint(equalTo: secondSeparator.trailingAnchor, constant: separatorPadding),
            secondsPickerView.heightAnchor.constraint(equalToConstant: 50),
            secondsPickerView.widthAnchor.constraint(equalToConstant: pickerViewWidth)
        ])
    }
    
    private func configureSeparator(isFirst: Bool) {
        let leadingAnchor: NSLayoutXAxisAnchor
        let separator: SeparatorLabel
        
        if isFirst {
            view.addSubview(firstSeparator)
            leadingAnchor = hoursPickerView.trailingAnchor
            separator = firstSeparator
        } else {
            view.addSubview(secondSeparator)
            leadingAnchor = minutesPickerView.trailingAnchor
            separator = secondSeparator
        }
        
        NSLayoutConstraint.activate([
            separator.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            separator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: separatorPadding),
            separator.widthAnchor.constraint(equalToConstant: 4)
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
