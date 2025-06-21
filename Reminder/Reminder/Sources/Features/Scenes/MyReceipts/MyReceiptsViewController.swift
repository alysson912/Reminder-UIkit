//
//  MyReceiptsViewController.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 20/06/25.
//

import UIKit

class MyReceiptsViewController: UIViewController {
    
    private var contentView: MyReceiptsView
    private weak var flowDelegate: MyReceiptsFlowDelegate?
    
  
    
    init(contentView: MyReceiptsView, flowDelegate: MyReceiptsFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        view.backgroundColor = Colors.gray800
        view.addSubview(contentView)
        
       
       // dismissKeyboard()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        contentView.delegate(delegate: self)
        
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

extension MyReceiptsViewController: MyReceiptsFlowDelegate {
   
    func goToReceipts() {
        
    }
    
    func actionTappedBackButton() {
        flowDelegate?.actionTappedBackButton()
    }
    
    func actionTappedAddButton() {
        
    }
    
    
}
