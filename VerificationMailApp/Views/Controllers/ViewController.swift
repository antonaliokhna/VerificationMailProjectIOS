//
//  ViewController.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/17/22.
//

import UIKit

class ViewController: UIViewController {

    private let statusLabel = StatusLabel()
    private let mailTextField = MailTextField()
    private let verificationButton = VerificationButton()
    private let domainsCollectionView = DomainsCollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )

    private lazy var verificationStackView = UIStackView(
        arrangedSubviews: [mailTextField, verificationButton, domainsCollectionView],
        axis: .vertical,
        spacing: 20
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .init(white: 1, alpha: 0.9)

        setUpViews()
        setUpDelegate()
        setConstraints()
    }

    private func setUpViews() {
        view.addSubview(statusLabel)
        view.addSubview(verificationStackView)
    }

    private func setUpDelegate() {
        mailTextField.actionsDelegate = self
        domainsCollectionView.dataSource = self
        domainsCollectionView.actionsDelegate = self
        verificationButton.addTarget(self, action: #selector(verificationButtonTapped), for: .touchUpInside)
    }

    @objc private func verificationButtonTapped() {
        print("Button tapped")
    }
}

//MARK: - CollectionViewActionsDelegateType

extension ViewController: CollectionViewActionsDelegateType {
    func collectionViewSelectItemAt(indexPath: IndexPath) {
        print(indexPath.row.description)
    }
}

//MARK: - TextFieldActionsDelegateType

extension ViewController: TextFieldActionsDelegateType {
    func textFieldShouldChange(text: String) {
        print(text)
    }

    func textFieldShouldClear() {
        print("clear")
    }
}

//MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell =
                domainsCollectionView.dequeueReusableCell(withReuseIdentifier: "domainCell", for: indexPath)
                as? DomainCollectionViewCell else {
            return UICollectionViewCell()
        }

        return cell
    }
}

//MARK: - setConstraints

extension ViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            statusLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statusLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])

        NSLayoutConstraint.activate([
            verificationStackView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            verificationStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verificationStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            verificationStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])

        NSLayoutConstraint.activate([mailTextField.heightAnchor.constraint(equalToConstant: 40)])
    }
}

