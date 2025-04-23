//
//  LocalizedConstants.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 22/04/25.
//

import Foundation
import UIKit

typealias LC = LocalizedConstants


enum LocalizedConstants: String {
   
    /* MARK: - LOGIN SCREEN */
 case titleLoginLabel

    /* MARK: - HOME SCREEN */

    /* MARK: - RECEIPTS SCREEN */

    /* MARK: - NEWRECEIPT SCREEN */
    
    
    var text: String {
        return rawValue.localized(.presentation)
    }
}
