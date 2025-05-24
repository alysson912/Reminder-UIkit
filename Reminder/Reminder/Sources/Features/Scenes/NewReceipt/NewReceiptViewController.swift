//
//  NewReceiptViewController.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 22/05/25.
//

import UIKit

class NewReceiptViewController: UIViewController {
    
     var contentView: NewReceiptView?
    
  //  private weak var flowDelegate: NewReceiptViewDelegate?
    
//    init(contentView: NewReceiptView, flowDelegate: NewReceiptViewDelegate) {
//        self.contentView = contentView
//        self.flowDelegate = flowDelegate
//        super.init(nibName: nil, bundle: nil)
//    }
    
    override func loadView() {
        contentView = NewReceiptView()
        view = contentView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupUI() {
        view.backgroundColor = Colors.gray800
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        self.contentView?.delegate(delegate: self)
    
    }
    
 
    
    private func setupConstraints(){
        contentView?.translatesAutoresizingMaskIntoConstraints = false
     //   contentView.inputViewController?.setupContentViewToBounds(contentView: contentView)
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
