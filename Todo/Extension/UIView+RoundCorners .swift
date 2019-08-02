//
//  UIView+RoundCorners.swift
//  Todo
//
//  Created by BinaryBoy on 7/28/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import UIKit

extension UIView {

    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }

}
