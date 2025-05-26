//
//  NewReceiptViewController.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 22/05/25.
//

import UIKit

class NewReceiptViewController: UIViewController {
    
     var contentView = NewReceiptView()
    
  //  private weak var flowDelegate: NewReceiptViewDelegate?
    
//    init(contentView: NewReceiptView, flowDelegate: NewReceiptViewDelegate) {
//        self.contentView = contentView
//        self.flowDelegate = flowDelegate
//        super.init(nibName: nil, bundle: nil)
//    }
    
 
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupUI() {
        view.backgroundColor = Colors.gray800
        view.addSubview(contentView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        self.contentView.delegate(delegate: self)
    
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

extension NewReceiptViewController: NewReceiptViewDelegate {
    func addButtonAction() {
        print("addButton pressionado!")
    }
    
    func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    
}
