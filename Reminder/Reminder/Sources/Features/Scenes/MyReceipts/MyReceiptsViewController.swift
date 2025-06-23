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
    private var viewModel = MyReceiptsViewModel()
    
  private let mockMedicamentos = [
    ("buscopam", "13:00", "2 em 2 horas"),
    ("buscopam", "3:00", "8 em 8 horas"),
    ("buscopam", "00:00", "12 em 12 horas"),
    ("buscopam", "1:00", "1x ao dia"),
  ]
    
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
        contentView.setupTableView(delegate: self, dataSource: self)
        
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

extension MyReceiptsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MyReceiptsTableViewCell.identifier, for: indexPath) as? MyReceiptsTableViewCell
        
        let medicamentos = mockMedicamentos[indexPath.section]
        cell?.setupCell(title: medicamentos.0, time: medicamentos.1, recurrence: medicamentos.2)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }
    
   
    
    
    
   
}
