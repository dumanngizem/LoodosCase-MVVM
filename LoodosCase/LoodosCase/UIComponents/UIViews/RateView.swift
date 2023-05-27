//
//  RateView.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import UIKit

class RateView: UIView {

    private let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public var ratingData: [RatingResponse]? {
        didSet {
            configureContents()
        }
    }
}

// MARK: - UILayout
extension RateView {
    
    private func addSubViews() {
        addStackView()
    }
    
    private func addStackView() {
        addSubview(stackView)
        stackView.edgesToSuperview(excluding: .trailing)
    }
}

// MARK: - ConfigureContents
extension RateView {
    
    private func configureContents() {
        guard let data = ratingData else { return }
        stackView.removeAllArrangedSubviews()
        data.enumerated().forEach { item in
            let view = ChipView()
            view.setTitle = item.element.value
            view.currentIndex = item.offset
            stackView.addArrangedSubview(view)
        }
    }
}
