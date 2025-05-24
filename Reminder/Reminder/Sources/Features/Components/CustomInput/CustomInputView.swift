//
//  CustomInputView.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 23/05/25.
//

import UIKit


class CustomInputView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nova Receita!"
        label.textColor = Colors.gray100
        label.font = Typography.label
        return label
    }()
    
    lazy var textField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = Typography.input
        text.textColor = Colors.gray100
        text.backgroundColor = Colors.gray800
        text.borderStyle = .roundedRect
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.gray.cgColor
        text.layer.cornerRadius = 8
        return text
    }()
    
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(textField)
    }
    

    init(title: String, placeHolder: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.text = title
        self.textField.placeholder = placeHolder
        
        configurePlaceHolder(placeHolder: placeHolder)
        setupUI()
        setupConstraints()
    }
    
    private func configurePlaceHolder(placeHolder: String) {
        textField.attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.foregroundColor: Colors.gray200])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
       
            self.heightAnchor.constraint(equalToConstant: 85),
          
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.small),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    func getText() -> String {
        return textField.text ?? ""
    }
}

