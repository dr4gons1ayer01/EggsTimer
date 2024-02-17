//
//  ViewController.swift
//  EggsTimer
//
//  Created by Иван Семенов on 13.02.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let mainView = MainView()
    let eggTime = [
        "soft":5,
        "medium":7,
        "hard":10,
    ]
    var countdownTimer: Timer?  //время обратного отсчета
    var reminingTime: Int = 0   //оставшееся время
    var selectedTime: Int?      //выбранное время для прогрессВью
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        setupButtons()
        
    }
    func startTimer(for time: Int) {
        countdownTimer?.invalidate()
        reminingTime = time
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        reminingTime -= 1
        let progress = Float(reminingTime) / Float(selectedTime ?? 1)
        mainView.progressView.setProgress(progress, animated: false)
        
        if reminingTime > 0 {
            self.mainView.timeLabel.text = "\(reminingTime)"
            UIView.animate(withDuration: 0.75, animations: {
                self.mainView.timeLabel.transform = CGAffineTransform(scaleX: 3.5, y: 3.5)
                self.mainView.timeLabel.alpha = 0.0
            }) { _ in
                self.mainView.timeLabel.text = "\(self.reminingTime - 1)"
                if self.reminingTime == 1 {
                    self.mainView.timeLabel.text = "" //пустая строка, если осталась последняя секунда
                }
                self.mainView.timeLabel.transform = .identity
                self.mainView.timeLabel.alpha = 1.0
            }
        } else {
            countdownTimer?.invalidate()
            mainView.label.text = "DONE!"
            mainView.timeLabel.text = ""
            animateShakeForButtons()
            playSound()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.mainView.label.text = "How do you like your eggs?"
                
            }
        }
    }
    func setupButtons() {
        for (key, value) in eggTime {
            switch key {
            case "soft": mainView.softButton.addAction(UIAction { _ in
                self.selectedTime = value
                self.startTimer(for: value)
            }, for: .touchUpInside)
            case "medium": mainView.mediumButton.addAction(UIAction { _ in
                self.selectedTime = value
                self.startTimer(for: value)
            }, for: .touchUpInside)
            case "hard": mainView.hardButton.addAction(UIAction { _ in
                self.selectedTime = value
                self.startTimer(for: value)
            }, for: .touchUpInside)
            default: break
            }
        }
    }
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
        player = try? AVAudioPlayer(contentsOf: url)
        player.play()
    }
    func animateShakeForButtons() {
            mainView.softButton.layer.add(shakeAnimation, forKey: nil)
            mainView.mediumButton.layer.add(shakeAnimation, forKey: nil)
            mainView.hardButton.layer.add(shakeAnimation, forKey: nil)
        }
}
extension CALayer {
    func shake(duration: Double = 0.1, completionDelegate: CAAnimationDelegate? = nil) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = duration
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.position.x - 5, y: self.position.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.position.x + 5, y: self.position.y))
        if let delegate: CAAnimationDelegate = completionDelegate {
            animation.delegate = delegate
        }
        self.add(animation, forKey: "position")
    }
}

//шаблон анимации тряски
let shakeAnimation: CAAnimation = {
    let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
    animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
    animation.duration = 0.6
    animation.values = [-10.0, 10.0, -10.0, 10.0, -5.0, 5.0, -2.0, 2.0, 0.0 ]
    return animation
}()

