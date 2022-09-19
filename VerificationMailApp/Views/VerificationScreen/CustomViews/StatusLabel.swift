//
//  StatusLabel.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/17/22.
//

import UIKit

class StatusLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        font = .systemFont(ofSize: 22, weight: .medium)
        text = "Check your mail adress"
        textColor = .systemBlue
        translatesAutoresizingMaskIntoConstraints = false
    }

    func setTitle(value: ValidationStatuses) {
        switch value {
        case .success:
            text = "Mail is valid"
            textColor = .systemGreen
        case .failure:
            text = "Mail is not valid"
            textColor = .systemRed
        case .default:
            text = "Check your mail adress"
            textColor = .systemBlue
        }
    }
}
