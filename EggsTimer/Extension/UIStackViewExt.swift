//
//  UIStackViewExt.swift
//  EggsTimer
//
//  Created by Иван Семенов on 13.02.2024.
//

import UIKit

extension UIStackView {
    convenience init(views: [UIView], 
                     axis: NSLayoutConstraint.Axis = .vertical,
                     spacing: CGFloat = 5,
                     alignment: Alignment = .center) {
        self.init(arrangedSubviews: views)
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
    }
}
