//
//  UIButtonExt.swift
//  EggsTimer
//
//  Created by Иван Семенов on 14.02.2024.
//

import UIKit

extension UIButton {
    convenience init(title: String?, 
                     image: UIImage) {
        self.init(type: .custom)
        self.setTitle(title, for: .normal)
        self.setImage(image, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        self.imageView?.contentMode = .scaleAspectFit
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 10)
        self.titleEdgeInsets = UIEdgeInsets(top: 140, left: -130, bottom: 0, right: 0)
        self.widthAnchor.constraint(equalToConstant: 130).isActive = true
        self.heightAnchor.constraint(equalToConstant: 130).isActive = true
    }
}
