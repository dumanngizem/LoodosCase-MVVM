//
//  EmptyView.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import UIKit
import TinyConstraints

class EmptyView: UIView {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    let circleView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange.withAlphaComponent(0.60)
        view.layer.cornerRadius = 36
        return view
    }()

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .orange
        return imageView
    }()
  
    let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    public var setImage: UIImage? {
        didSet {
            imageView.image = setImage?.withRenderingMode(.alwaysTemplate)
        }
    }
    
    public var messageText: String? {
        didSet {
            messageLabel.text = messageText
        }
    }
}

// MARK: - UILayout
extension EmptyView {
    
    private func addSubViews() {
        addCircleView()
        addImageView()
        addMessageLabel()
    }
    
    private func addCircleView() {
        addSubview(circleView)
        circleView.size(.init(width: 72, height: 72))
        circleView.centerInSuperview()
    }
    
    private func addImageView() {
        circleView.addSubview(imageView)
        imageView.size(.init(width: 40, height: 40))
        imageView.centerInSuperview()
    }
    
    private func addMessageLabel() {
        addSubview(messageLabel)
        messageLabel.topToBottom(of: circleView, offset: 16)
        messageLabel.horizontalToSuperview(insets: .horizontal(64))
    }
}
