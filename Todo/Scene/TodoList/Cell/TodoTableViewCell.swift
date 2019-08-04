//
//  BookCell.swift
//  Todo
//
//  Created by BinaryBoy on 7/28/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import UIKit
import SnapKit

class TodoTableViewCell: UITableViewCell, Reusable {

    var todoTitleLabel: UILabel!
    var todoDetailsLabel: UILabel!
    var isDoneSwitch: UISwitch!
    var cardView: UIView!
    var labelsStackView: UIStackView!
    var stackView: UIStackView!
    
    weak var todoRepository: TodoRepository?
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
            todoDetailsLabel.text = todoItem.details
            isDoneSwitch.isOn = Bool(todoItem.completed) ?? false
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

        labelsStackView = UIStackView(arrangedSubviews: [todoTitleLabel, todoDetailsLabel])
        labelsStackView.axis = .vertical
        labelsStackView.alignment = .leading
        labelsStackView.spacing = 0
        
        stackView = UIStackView(arrangedSubviews: [labelsStackView, isDoneSwitch])
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
        
        
        todoDetailsLabel = UILabel()
        todoDetailsLabel.font = UIFont(name: todoDetailsLabel.font.fontName, size: 13)
        todoDetailsLabel.numberOfLines = 0
        
        isDoneSwitch =  UISwitch(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        isDoneSwitch.addTarget(self, action: #selector(switchStateDidChange(_:)), for: .valueChanged)
      
    }
    
    @objc func switchStateDidChange(_ sender: UISwitch) {
        guard let item = todoItem else {
            return
        }
        todoRepository?.update(item: item, completed: sender.isOn)

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
