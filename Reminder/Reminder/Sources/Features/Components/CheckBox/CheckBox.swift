//
//  CheckBox.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 24/05/25.
//

import UIKit

class CheckBox: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.gray200
        label.font = Typography.input
        return label
    }()
        
    lazy var checkbox: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.setImage(UIImage(systemName: "square"), for: .normal)
        btn.tintColor = Colors.gray400
        return btn
    }()
    
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(checkbox)
        
    }
    
     init(title: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints  = false
        setupUI()
        titleLabel.text = title
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
    
            checkbox.leadingAnchor.constraint(equalTo: leadingAnchor),
            checkbox.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkbox.widthAnchor.constraint(equalToConstant: 24),
            checkbox.heightAnchor.constraint(equalToConstant: 24),
            
            titleLabel.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor, constant: Metrics.small),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}

