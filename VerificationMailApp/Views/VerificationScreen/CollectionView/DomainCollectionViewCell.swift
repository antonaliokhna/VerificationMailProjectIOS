//
//  DomainCollectionViewCell.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/17/22.
//

import Foundation
import UIKit

class DomainCollectionViewCell: UICollectionViewCell {

    let domainLabel: UILabel = {
        let label = UILabel()
        label.text = "@gmail.com"
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setUpViews()
        setConstraints()
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpViews() {
        addSubview(domainLabel)
    }

    private func configure() {
        contentView.backgroundColor = .lightGray
        contentView.layer.cornerRadius = 10
        contentView.alpha = 0.5
    }
}

//MARK: - setConstraints

extension DomainCollectionViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            domainLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            domainLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
