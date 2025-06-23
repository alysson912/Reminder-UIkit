//
//  MyReceiptsView.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 20/06/25.
//

import UIKit


protocol MyReceiptsFlowDelegate: AnyObject {
    func goToReceipts()
    func actionTappedBackButton()
    func actionTappedAddButton()
}

class MyReceiptsView: UIView {

    private weak var delegate: MyReceiptsFlowDelegate?
    
    public func delegate(delegate: MyReceiptsFlowDelegate?) {
        self.delegate = delegate
    }
    
    lazy var headerBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray600
        return view
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = Colors.primaryBlueBase
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = Colors.primaryBlueBase
        button.addTarget(self, action: #selector(tappedAddButton), for: .touchUpInside)
        return button
    }()
      
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Minhas receitas!"
        label.textColor = Colors.primaryBlueBase
        label.font = Typography.heading
        return label
    }()
    
    
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Acompanhe seus medicamentos cadastrados e lembretes!"
        label.textColor = Colors.gray200
        label.font = Typography.body
        label.numberOfLines = 0
        return label
    }()
    
    
    lazy var contentBackGround: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = Metrics.medium
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner] // arredondando a parte de cima
        view.layer.masksToBounds = true // agarrar as bordas
        view.backgroundColor = Colors.gray800
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none // retirando linhas
        tableView.showsVerticalScrollIndicator = false // desativando scrool indicator
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        
        // TO DO: Register
        tableView.register(MyReceiptsTableViewCell.self, forCellReuseIdentifier: MyReceiptsTableViewCell.identifier)
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    func setupTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    @objc
    private func tappedBackButton() {
        delegate?.actionTappedBackButton()
    }
    
    @objc
    private func tappedAddButton() {
        delegate?.actionTappedAddButton()
    }
    
    private func setupUI() {
        addSubview(headerBackgroundView)
        headerBackgroundView.addSubview(backButton)
        headerBackgroundView.addSubview(titleLabel)
        headerBackgroundView.addSubview(subtitleLabel)
        headerBackgroundView.addSubview(addButton)
        addSubview(contentBackGround)
        contentBackGround.addSubview(tableView)
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
            headerBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            headerBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerBackgroundView.heightAnchor.constraint(equalToConstant: Metrics.backgroundProfileSize),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.small),
            backButton.leadingAnchor.constraint(equalTo: headerBackgroundView.leadingAnchor, constant: Metrics.medium),
            backButton.heightAnchor.constraint(equalToConstant: Metrics.homeButtonWidth),
            backButton.widthAnchor.constraint(equalToConstant: Metrics.homeButtonWidth),
            
            addButton.trailingAnchor.constraint(equalTo: headerBackgroundView.trailingAnchor, constant: -Metrics.medium),
            addButton.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            addButton.heightAnchor.constraint(equalToConstant: 40),
            addButton.widthAnchor.constraint(equalToConstant: 40),
            
            titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Metrics.medium),
            titleLabel.leadingAnchor.constraint(equalTo: backButton.leadingAnchor),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.small),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: headerBackgroundView.trailingAnchor, constant: -Metrics.medium),
            
            contentBackGround.topAnchor.constraint(equalTo: headerBackgroundView.bottomAnchor, constant: -Metrics.small),
            contentBackGround.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentBackGround.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentBackGround.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: contentBackGround.topAnchor, constant: Metrics.medium),
            tableView.leadingAnchor.constraint(equalTo: contentBackGround.leadingAnchor, constant: Metrics.medium),
            tableView.trailingAnchor.constraint(equalTo: contentBackGround.trailingAnchor, constant: -Metrics.medium),
            tableView.bottomAnchor.constraint(equalTo: contentBackGround.bottomAnchor),
        ])
    }
}

