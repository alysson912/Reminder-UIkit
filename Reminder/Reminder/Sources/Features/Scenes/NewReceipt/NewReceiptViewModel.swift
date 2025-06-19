//
//  NewReceiptViewModel.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 26/05/25.
//

import Foundation

final class NewReceiptViewModel {
    func addReceipt(remedy: String, time: String, recurrence: String, takeNow: Bool) {
        DBHelper.shared.insertReceipt(remedy: remedy, time: time, recurrence: recurrence, takeNow: takeNow)
    }
}
