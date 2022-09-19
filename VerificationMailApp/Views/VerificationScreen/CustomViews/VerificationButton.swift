//
//  VerificationButton.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/17/22.
//

import UIKit

class VerificationButton: UIButton {

    private var status: ValidationStatuses = .default {
        willSet {
            guard newValue == .success else {
                alpha = 0.5
                isEnabled = false
                return
            }

            alpha = 1
            isEnabled = true
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        configutate()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configutate() {
        status = .default
        backgroundColor = .gray
        setTitle("Verification", for: .normal)
        titleLabel?.font = .systemFont(ofSize: 20)
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }

    func setStatus(value: ValidationStatuses) {
        status = value
    }
}
