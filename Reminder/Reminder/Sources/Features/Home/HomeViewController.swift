//
//  HomeViewViewController.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 02/05/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var contentView: HomeView
    private weak var flowDelegate: LoginBottomSheetFlowDelegate?
    
    init(contentView: HomeView, flowDelegate: LoginBottomSheetFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

   

}
