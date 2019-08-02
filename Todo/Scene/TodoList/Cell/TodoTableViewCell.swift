//
//  BookCell.swift
//  Todo
//
//  Created by BinaryBoy on 7/28/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import UIKit
import SnapKit

class TodoTableViewCell: UITableViewCell, CellReusable {

    var todoTitleLabel: UILabel!
    var isDoneSwitch: UISwitch!
    var cardView: UIView!
    var stackView: UIStackView!

    struct CardView {

        static let cornerRadius: CGFloat = 5.0
        static let shadowColor = UIColor.gray.cgColor
        static let shadowRadius: CGFloat = 12.0
        static let shadowOpacity: Float = 0.7
    }

    let numberOfLinesForLabels = 2

    var todoItem: TodoItem? = nil {
        didSet {
            guard let todoItem = todoItem else {
                return
            }

            todoTitleLabel.text = todoItem.name
            isDoneSwitch.isOn = todoItem.completed
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none

        setupCardView()

        setupViews()

        setupStackView()

        setupConstraints()

    }

    func setupStackView() {

        stackView = UIStackView(arrangedSubviews: [todoTitleLabel, isDoneSwitch])
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.spacing = 0
        cardView.addSubview(stackView)
    }

    func setupCardView() {

        cardView =  UIView()
        cardView.layer.cornerRadius = CardView.cornerRadius
        cardView.layer.shadowColor = CardView.shadowColor
        cardView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        cardView.layer.shadowRadius = CardView.shadowRadius
        cardView.layer.shadowOpacity = CardView.shadowOpacity
        addSubview(cardView)
    }

    func setupViews() {

        todoTitleLabel = UILabel()
        todoTitleLabel.font = UIFont(name: todoTitleLabel.font.fontName, size: 15)

        todoTitleLabel.numberOfLines = 1
        
        isDoneSwitch =  UISwitch(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        isDoneSwitch.addTarget(self, action: #selector(switchStateDidChange(_:)), for: .valueChanged)
      
    }
    
    @objc func switchStateDidChange(_ sender: UISwitch) {
        guard let todoItem = todoItem else {
            return
        }
        RealmManager.update(todoItem: todoItem, completed: sender.isOn)

    }
    
    func setupConstraints() {

        cardView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self).inset(8)
            make.centerY.equalTo(self)
            make.centerX.equalTo(self)
        }

        stackView.snp.makeConstraints { (make) -> Void in
            make.right.left.equalTo(cardView).offset(8)
            make.centerY.equalTo(cardView)
        }

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        todoTitleLabel.text = ""
        isDoneSwitch.isOn = false
    }

}
