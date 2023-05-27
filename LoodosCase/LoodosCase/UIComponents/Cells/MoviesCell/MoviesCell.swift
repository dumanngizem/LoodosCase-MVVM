//
//  MoviesCell.swift
//  LoodosCase
//
//  Created by Gizem Duman on 27.05.2023.
//

import UIKit
import TinyConstraints
import Kingfisher

class MoviesCell: UITableViewCell {
    
    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.backgroundColor = .gray.withAlphaComponent(0.3)
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private let yearLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func populate(image: String?, title: String?, year: String?) {
        configureContents(image: image, title: title, year: year)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        yearLabel.text = nil
    }
}

// MARK: - UILayout
extension MoviesCell {
    
    private func addSubViews() {
        addImageView()
        addTitleLabel()
        addYearLabel()
    }
    
    private func addImageView() {
        contentView.addSubview(movieImageView)
        movieImageView.leadingToSuperview(offset: 8)
        movieImageView.topToSuperview(offset: 8)
        movieImageView.bottomToSuperview(offset: -8)
        let width = contentView.frame.width * 0.43
        let height = (width * 10) / 8
        movieImageView.width(width)
        movieImageView.height(height, priority: .init(rawValue: 999))
    }
    
    private func addTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.top(to: movieImageView, offset: 8)
        titleLabel.leadingToTrailing(of: movieImageView, offset: 8)
        titleLabel.trailingToSuperview(offset: 8)
    }
    
    private func addYearLabel() {
        contentView.addSubview(yearLabel)
        yearLabel.leading(to: titleLabel)
        yearLabel.trailingToSuperview(offset: 8)
        yearLabel.topToBottom(of: titleLabel, offset: 4)
    }
}

// MARK: - ConfigureContents
extension MoviesCell {
    
    private func configureContents(image: String?, title: String?, year: String?) {
        if let image = image {
            movieImageView.kf.setImage(with: image.toURL)
        }
        
        if let title = title {
            titleLabel.text = title
        }
        
        if let year = year {
            yearLabel.text = year
        }
    }
}
