//
//  DatePickerViewController.swift
//  PickersMenusActions
//
//  Created by Gabriel Theodoropoulos.
//

import UIKit

class DatePickerViewController: UIViewController {

    var datePicker: UIDatePicker?
    var datePickerConstraints = [NSLayoutConstraint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        showDatePicker()
    }

    
    func showDatePicker() {
        datePicker = UIDatePicker()
        datePicker?.date = Date()
        datePicker?.locale = .current
        datePicker?.preferredDatePickerStyle = .compact
        datePicker?.addTarget(self, action: #selector(handleDateSelection), for: .valueChanged)
        addDatePickerAsSubview()
    }
    
    
    @IBAction func updateDatePicker(_ sender: Any) {
        guard let segmentedControl = sender as? UISegmentedControl else { return }

        switch segmentedControl.selectedSegmentIndex {
            case 0: datePicker?.preferredDatePickerStyle = .compact
            case 1: datePicker?.preferredDatePickerStyle = .inline
            case 2: datePicker?.preferredDatePickerStyle = .wheels
            default: break
        }

        updateDatePickerConstraints()
    }
    
    
    
    func addDatePickerAsSubview() {
        guard let datePicker = datePicker else { return }
        self.view.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        updateDatePickerConstraints()
    }
    
    
    func updateDatePickerConstraints() {
        guard let datePicker = datePicker else { return }
        
        // Remove any previously set constraints.
        self.view.removeConstraints(datePickerConstraints)
        datePickerConstraints.removeAll()
        
        // Set new constraints depending on the date picker style.
        datePickerConstraints.append(datePicker.centerYAnchor.constraint(equalTo: self.view.centerYAnchor))
        
        if datePicker.preferredDatePickerStyle != .inline {
            datePickerConstraints.append(datePicker.centerXAnchor.constraint(equalTo: self.view.centerXAnchor))
        } else {
            datePickerConstraints.append(datePicker.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8))
            datePickerConstraints.append(datePicker.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8))
        }
        
        // Activate all constraints.
        NSLayoutConstraint.activate(datePickerConstraints)
    }
    
    
    @objc func handleDateSelection() {
        guard let picker = datePicker else { return }
        print("Selected date/time:", picker.date)
    }
    
}
