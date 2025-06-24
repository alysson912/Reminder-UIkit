//
//  MyReceiptsViewModel.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 23/06/25.
//

import Foundation
import UIKit

 class MyReceiptsViewModel {
    
    
    func fetchData() -> [Medicine] {
        return DBHelper.shared.fetchReceipts()
    }
    
    
    
    //MARK: - TableViewSetupSize
    
    public var numberOfRowsInSection: Int {
            return 5
        }
    
    public var heightForRowAt: CGFloat {
        return 125
    }
    
   
}

