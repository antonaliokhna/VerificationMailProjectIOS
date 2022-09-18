//
//  VerificationButton.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/17/22.
//

import UIKit

class VerificationButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)

        configutate()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configutate() {
        backgroundColor = .gray
        setTitle("Verification", for: .normal)
        titleLabel?.font = .systemFont(ofSize: 20)
        isEnabled = true
        alpha = 1
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
}
