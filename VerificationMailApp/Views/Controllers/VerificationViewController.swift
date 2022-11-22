//
//  ViewController.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/17/22.
//

import UIKit

class VerificationViewController: UIViewController {

    private let statusLabel = StatusLabel()
    private let mailTextField = MailTextField()
    private let verificationButton = VerificationButton()
    private let domainsCollectionView = DomainsCollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()

    private lazy var verificationStackView = UIStackView(
        arrangedSubviews: [mailTextField, verificationButton, domainsCollectionView],
        axis: .vertical,
        spacing: 20
    )

    private let verificationViewModel: VerificationViewModelType = VerificationViewModel()

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
        view.addSubview(activityIndicator)
    }

    private func setUpDelegate() {
        mailTextField.actionsDelegate = self
        domainsCollectionView.dataSource = self
        domainsCollectionView.actionsDelegate = self
        verificationButton.addTarget(self, action: #selector(verificationButtonTapped), for: .touchUpInside)
    }

    private func setViewsStatus(status: ValidationStatuses) {
        statusLabel.setStatus(value: status)
        verificationButton.setStatus(value: status)
    }

    @objc private func verificationButtonTapped() {
        guard let mailAdress = mailTextField.text else { return }
        activityIndicator.startAnimating()
        verificationButton.setStatus(value: .default)
        verificationViewModel.checkAvailabilityEmail(adress: mailAdress) { [weak self] mailResponseViewModel in
            guard let self = self else { return }
            self.activityIndicator.stopAnimating()
            self.verificationButton.setStatus(value: .success)

            guard let mailResponse = mailResponseViewModel else {
                CustomAlertController.showAlert(vc: self, title: "Error", message: "Data is empty")

                return
            }

            guard let autocorrectMail = mailResponse.getAutoCorrectMail() else {
                let message: String

                if mailResponse.isDeliverable() {
                    message = "Mail is deliverability"
                } else {
                    message = "Mail is not deliverability"
                }
                CustomAlertController.showAlert(vc: self, title: "Completion", message: message)

                return
            }

            let alertAction = UIAlertAction(title: "Replace", style: .destructive) { _ in
                self.mailTextField.setTitle(value: autocorrectMail)
            }
            CustomAlertController.showAlert(
                vc: self,
                title: "Invalid email",
                message: "Did you meant? \n \(autocorrectMail)",
                customActions: [alertAction]
            )
        }
    }
}

//MARK: - CollectionViewActionsDelegateType

extension VerificationViewController: CollectionViewActionsDelegateType {
    func collectionViewSelectItemAt(indexPath: IndexPath) {
        guard let mail = mailTextField.text else { return }
        let fullAdress = verificationViewModel.getFullMailAdress(by: indexPath, currentAdress: mail)
        self.setViewsStatus(status: fullAdress.isValidMailAdress())
        mailTextField.setTitle(value: fullAdress)
        domainsCollectionView.reloadData()
    }
}

//MARK: - TextFieldActionsDelegateTypex

extension VerificationViewController: TextFieldActionsDelegateType {
    func textFieldChange(mailAdress: String) {
        self.setViewsStatus(status: mailAdress.isValidMailAdress())
        verificationViewModel.filteredDomains(by: mailAdress)
        domainsCollectionView.reloadData()
    }

    func textFieldClear() {
        self.setViewsStatus(status: .default)
        verificationViewModel.clearFilteredDomains()
        domainsCollectionView.reloadData()
    }
}

//MARK: - UICollectionViewDataSource

extension VerificationViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return verificationViewModel.getFilteredDomainsCount()
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
        cell.setTitle(text: verificationViewModel.getFilteredDomain(by: indexPath))

        return cell
    }
}

//MARK: - setConstraints

extension VerificationViewController {
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
            verificationStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
        ])

        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 60),
        ])

        NSLayoutConstraint.activate([mailTextField.heightAnchor.constraint(equalToConstant: 40)])
    }
}

