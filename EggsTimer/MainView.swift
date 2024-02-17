//
//  MainView.swift
//  EggsTimer
//
//  Created by Иван Семенов on 13.02.2024.
//

import UIKit

class MainView: UIView {
    let label = UILabel()
    let softButton = UIButton(title: "Soft", image: UIImage(named: "soft_egg")!)
    let mediumButton = UIButton(title: "Medium", image: UIImage(named: "medium_egg")!)
    let hardButton = UIButton(title: "Hard", image: UIImage(named: "hard_egg")!)
    let progressView = UIProgressView(progressViewStyle: .default, progressTintColor: .systemYellow, trackTintColor: .systemGray2, height: 10, width: 300)
    let timeLabel = UILabel()
    
    init() {
        super.init(frame: CGRect())
        setupUI()
    }
    
    func setupUI() {
        backgroundColor = .systemPurple
        label.text = "How do you like your eggs?"
        label.font = .systemFont(ofSize: 28)
        hardButton.titleEdgeInsets = UIEdgeInsets(top: 130, left: -110, bottom: -10, right: 0)
        timeLabel.text = ""
        timeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        timeLabel.font = .systemFont(ofSize: 24)
        
        let eggStack = UIStackView(views: [softButton,
                                           mediumButton,
                                           hardButton],
                                   axis: .horizontal)

        let stack = UIStackView(views: [eggStack, timeLabel, progressView],
                                spacing: 60)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        stack.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stack)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            stack.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 200),
            stack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 5),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

import SwiftUI

struct MainViewProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().ignoresSafeArea()
    }
    struct ContainerView: UIViewRepresentable {
        let view = MainView()
        
        func makeUIView(context: Context) -> some UIView {
            return view
        }
        func updateUIView(_ uiView: UIViewType, context: Context) { }
    }
}
