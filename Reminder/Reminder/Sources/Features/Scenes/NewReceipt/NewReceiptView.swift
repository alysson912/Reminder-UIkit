//
//  NewReceiptView.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 22/05/25.
//

import UIKit

protocol NewReceiptViewDelegate: AnyObject {
    func backButtonAction()
    func addButtonAction()
 //   func navigateToRecipes()
}


class NewReceiptView: UIView {

  
    private weak var delegate: NewReceiptViewDelegate?
    
    public func delegate(delegate: NewReceiptViewDelegate?) {
        self.delegate = delegate
    }
    
    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        // btn.setTitle("Calcular", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        btn.clipsToBounds = true
        btn.layer.cornerRadius =  8
        btn.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        btn.tintColor = .blue
        btn.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nova Receita!"
        label.textColor = Colors.primaryRedBase
        label.font = Typography.heading
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Adicione suas pescricoes médicas para receber lembretes de quando tomar seu remédio !"
        label.textColor = Colors.gray200
        label.font = Typography.body
        label.numberOfLines = 0
        return label
    }()

    
    lazy var addButton: UIButton = {
        let btn = UIButton( type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = Colors.primaryRedBase
        btn.setTitle("Adicionar", for: .normal)
        //btn.setTitleColor(Colors.gray800, for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius =  12
        btn.contentMode = .scaleAspectFill
        btn.addTarget(self, action: #selector(tappedAddButton), for: .touchUpInside)
        return btn
    }()
    
    let remedyInput = CustomInputView(title: "Remedio", placeHolder: "nome do medicamento:")
    let timeInput = CustomInputView(title: "Horário", placeHolder: "12:00")
    let recurrenceInput = CustomInputView(title: "Recorrência", placeHolder: "Selecione")
    let takeNowCheckBox = CheckBox(title: "Tomar agora")
    
    let timePicker: UIDatePicker = {
       let picker = UIDatePicker()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.datePickerMode = .time
        picker.preferredDatePickerStyle = .wheels
        return picker
    }()
    
    let recurrencePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        return picker
    }()
    
    let recurrenceOptions = [
        "De hora em hora",
        "2 em 2 horas",
        "4 em 4 horas",
        "8 em 8 horas",
        "12 em 12 horas",
        "1 por dia"
    ]
    
    @objc
    private func tappedBackButton() {
        delegate?.backButtonAction()
    }
    
    @objc
    private func tappedAddButton() {
        delegate?.addButtonAction()
    }
    
  
    private func setupUI() {
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(remedyInput)
        addSubview(timeInput)
        addSubview(recurrenceInput)
        addSubview(takeNowCheckBox)
        addSubview(addButton)
        
        setupRecurrenceInput()
        setupTimeInput()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.small),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            backButton.widthAnchor.constraint(equalToConstant: 24),
            
            titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Metrics.medium),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.small),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.small),
            
            remedyInput.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Metrics.medium),
            remedyInput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            remedyInput.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            
            timeInput.topAnchor.constraint(equalTo: remedyInput.bottomAnchor, constant: Metrics.medium),
            timeInput.leadingAnchor.constraint(equalTo: remedyInput.leadingAnchor),
            timeInput.trailingAnchor.constraint(equalTo: remedyInput.trailingAnchor),
            
            recurrenceInput.topAnchor.constraint(equalTo: timeInput.bottomAnchor, constant: Metrics.medium),
            recurrenceInput.leadingAnchor.constraint(equalTo: timeInput.leadingAnchor),
            recurrenceInput.trailingAnchor.constraint(equalTo: timeInput.trailingAnchor),
            
            takeNowCheckBox.topAnchor.constraint(equalTo: recurrenceInput.bottomAnchor, constant: Metrics.medium),
            takeNowCheckBox.leadingAnchor.constraint(equalTo: recurrenceInput.leadingAnchor),
            takeNowCheckBox.trailingAnchor.constraint(equalTo: recurrenceInput.trailingAnchor),
            
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.high),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.high),
            addButton.heightAnchor.constraint(equalToConstant: 56),
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.high),
            
        ])
    }
    

    
    private func setupTimeInput() {
        let toobar = UIToolbar()
        toobar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didSelectTime))
        toobar.setItems([doneButton], animated: true)
        
        timeInput.textField.inputView = timePicker
        timeInput.textField.inputAccessoryView = toobar
    }
    
    @objc
    private func didSelectTime() {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        timeInput.textField.text = formatter.string(from: timePicker.date)
        timeInput.textField.resignFirstResponder()
    }
    

    
    private func setupRecurrenceInput() {
        let toobar = UIToolbar()
        toobar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didSelectRecurrence))
        toobar.setItems([doneButton], animated: true)
        
        recurrenceInput.textField.inputView = recurrencePicker
        recurrenceInput.textField.inputAccessoryView = toobar
        
        recurrencePicker.delegate = self
        recurrencePicker.dataSource = self
    }
    
    @objc
    private func didSelectRecurrence() {
        let selectedRow = recurrencePicker.selectedRow(inComponent: 0)
        recurrenceInput.textField.text = recurrenceOptions[selectedRow]
        recurrenceInput.textField.resignFirstResponder()
    }

}


extension NewReceiptView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return recurrenceOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return recurrenceOptions[row]
    }
}
