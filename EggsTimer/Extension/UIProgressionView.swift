//
//  UIProgressionView.swift
//  EggsTimer
//
//  Created by Иван Семенов on 15.02.2024.
//

import UIKit

extension UIProgressView {
    convenience init(progressViewStyle: UIProgressView.Style,
                     progressTintColor: UIColor,
                     trackTintColor: UIColor,
                     height: CGFloat,
                     width: CGFloat,
                     shadowColor: CGColor = UIColor.black.cgColor,
                     shadowOpacity: Float = 0.5,
                     shadowOffset: CGSize = CGSize(width: 0, height: 2),
                     shadowRadius: CGFloat = 4) {
        self.init(progressViewStyle: progressViewStyle)
        self.progressTintColor = progressTintColor
        self.trackTintColor = trackTintColor

        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.layer.shadowColor = shadowColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        self.layer.cornerRadius = height / 2
    }
}

