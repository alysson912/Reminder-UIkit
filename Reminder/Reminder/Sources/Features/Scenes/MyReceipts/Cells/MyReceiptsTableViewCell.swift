//
//  MyReceiptsTableViewCell.swift
//  Reminder
//
//  Created by ALYSSON MENEZES on 22/06/25.
//

import UIKit



class MyReceiptsTableViewCell: UITableViewCell {
    
    static let identifier: String = String( describing: MyReceiptsTableViewCell.self)
    
    private lazy var screen: MyReceiptsTableViewCellScreen = {
        let view = MyReceiptsTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(screen)
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints(){
        screen.pin(to: self)
    }
    // setup cells
    
    public func setupCell(title: String, time: String, recurrence: String) {
        screen.titleLabel.text = title
        screen.timeLabel.text = time
        screen.recurrenceLabel.text = recurrence
    }
}

