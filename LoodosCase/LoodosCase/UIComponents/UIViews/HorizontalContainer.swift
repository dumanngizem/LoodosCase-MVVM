//
//  HorizontalContainer.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import UIKit
import TinyConstraints

class HorizontalContainer: UIView {
    
    private let keyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.textColor = .gray
        label.textAlignment = .right
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var setKey: String? {
        didSet {
            keyLabel.text = setKey
        }
    }
    
    public var setValue: String? {
        didSet {
            valueLabel.text = setValue
        }
    }
}

// MARK: - UILayout
extension HorizontalContainer {
    
    private func addSubViews() {
        addKeyLabel()
        addValueLabel()
    }
    
    private func addKeyLabel() {
        addSubview(keyLabel)
        keyLabel.edgesToSuperview(excluding: .trailing, insets: .left(8), priority: .init(rawValue: 999))
    }
    
    private func addValueLabel() {
        addSubview(valueLabel)
        valueLabel.trailingToSuperview(offset: 16)
        valueLabel.leadingToTrailing(of: keyLabel, offset: 8)
        valueLabel.centerY(to: keyLabel)
    }
}

// MARK: - ConfigureContents
extension HorizontalContainer {
    
    private func configureContents() {
        height(42)
        layer.cornerRadius = 10
        backgroundColor = .white
    }
}

