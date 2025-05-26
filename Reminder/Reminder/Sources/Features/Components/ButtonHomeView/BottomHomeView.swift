//
//  BottomHomeView.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 22/05/25.
//

import UIKit

class BottomHomeView: UIView {
    //MARK: // closure: quem implementar decidirá o que será feito
    var tapAction: (() -> Void)?
 
   private var iconView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray600
        view.layer.cornerRadius = 10
        return view
    }()
    
    private var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.subHeading
        label.textColor = Colors.gray100
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Typography.body
        label.textColor = Colors.gray200
        label.numberOfLines = 0
        
        return label
    }()

    private var arrowImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = Colors.gray300
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private func setupUI() {
        addSubview(iconView)
        iconView.addSubview(iconImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(arrowImageView)
    }
    
    init(icon: UIImage?, titleLabel: String, descriptionLabel: String) {
        super.init(frame: .zero)
       
        self.iconImageView.image = icon
        self.titleLabel.text = titleLabel
        self.descriptionLabel.text = descriptionLabel
        
        backgroundColor = Colors.gray700
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10

        setupGesture()
        setupUI()
        setupConstraints()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.addGestureRecognizer(tapGesture)
        self.isUserInteractionEnabled = true
    }
    @objc private func handleTap() {
        tapAction?()
    }
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.widthAnchor.constraint(equalToConstant: 80),
            iconView.heightAnchor.constraint(equalToConstant: 80),
            
            iconImageView.centerXAnchor.constraint(equalTo: iconView.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 48),
            iconImageView.heightAnchor.constraint(equalToConstant: 48),
           
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.medium),
            titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: Metrics.medium16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Metrics.medium16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -Metrics.small),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.small),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Metrics.medium16),
            
            arrowImageView.centerYAnchor.constraint(equalTo: iconView.centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium16),
            arrowImageView.widthAnchor.constraint(equalToConstant: 16),
          //  arrowImageView.heightAnchor.constraint(equalToConstant: 16),
            
            ])
    }
}
