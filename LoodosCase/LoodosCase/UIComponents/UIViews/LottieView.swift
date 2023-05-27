//
//  LottieView.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import Foundation
import TinyConstraints
import Lottie

public class LottieView: UIView {
    
    private var animationView: LottieAnimationView = LottieAnimationView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI Layout
extension LottieView {
    
    private func addSubViews() {
        addAnimationView()
    }
    
    private func addAnimationView() {
        addSubview(animationView)
        animationView.centerInSuperview()
        animationView.size(.init(width: 350, height: 350))
    }
}

// MARK: - Configure
extension LottieView {
    
    private func configureContents() {
        backgroundColor = .white.withAlphaComponent(0.9)
        size(.init(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        configureAnimationView()
    }
    
    private func configureAnimationView() {
        animationView.animation = LottieAnimation.named("loading-animation")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.75
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.backgroundColor = .clear
        animationView.play()
    }
}

public extension UIWindow {
    
    func showLottieView() {
        guard !subviews.contains(where: { $0 is LottieView }) else { return }
        
        let activityIndicator = LottieView()
        activityIndicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        activityIndicator.frame = bounds
        
        UIView.transition(
            with: self,
            duration: 0,
            options: .transitionCrossDissolve,
            animations: {
                self.addSubview(activityIndicator)
            }
        )
    }
    
    func hideLottieView() {
        subviews.filter({ $0 is LottieView }).forEach({ $0.removeFromSuperview() })
    }
}
