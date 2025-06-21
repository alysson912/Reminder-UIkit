//
//  NewReceiptViewController.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 22/05/25.
//

import UIKit

class NewReceiptViewController: UIViewController {
    
    private var contentView = NewReceiptView()
    private let viewModel = NewReceiptViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupUI() {
        view.backgroundColor = Colors.gray800
        view.addSubview(contentView)
        
        self.contentView.flowDelegate(flowDelegate: self)
        contentView.recurrencePicker.delegate = self
        contentView.recurrencePicker.dataSource = self
        dismissKeyboard()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }
    
    private func setupConstraints(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
   
}

//extension NewReceiptViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//}

extension NewReceiptViewController: NewReceiptViewFlowDelegate {
    func addButtonAction() {
        let remedy = contentView.remedyInput.getText()
        let time = contentView.timeInput.getText()
        let recurrence = contentView.recurrenceInput.getText()
        let takeNow = false
        
        viewModel.addReceipt(remedy: remedy,
                             time: time,
                             recurrence: recurrence,
                             takeNow: takeNow)
        print("receita: \(remedy) adicionado")
    }
    
    func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    
}

extension NewReceiptViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return contentView.recurrenceOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return contentView.recurrenceOptions[row]
    }
}
