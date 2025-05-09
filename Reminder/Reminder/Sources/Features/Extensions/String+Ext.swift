//
//  String+Ext.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 09/05/25.
//

import Foundation

extension String {
    var localized : String {
        NSLocalizedString(self, comment: "")
    }
}
