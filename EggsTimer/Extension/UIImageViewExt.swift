//
//  UIImageViewExt.swift
//  EggsTimer
//
//  Created by Иван Семенов on 13.02.2024.
//

import UIKit

extension UIImageView {
    convenience init(image: UIImage? = nil,
                     contentMode: UIView.ContentMode = .scaleAspectFit,
                     width: CGFloat,
                     height: CGFloat) {
        self.init(image: image)
        self.contentMode = contentMode
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
}
