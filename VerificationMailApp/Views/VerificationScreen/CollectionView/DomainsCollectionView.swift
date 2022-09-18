//
//  MailsCollectionView.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/17/22.
//

import Foundation
import UIKit

class DomainsCollectionView: UICollectionView {

    weak var actionsDelegate: CollectionViewActionsDelegateType?

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)

        register(DomainCollectionViewCell.self, forCellWithReuseIdentifier: "domainCell")

        configure()
        setUpDelegate()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
    }

    private func setUpDelegate() {
        delegate = self
    }
}

//MARK: - UICollectionViewDelegate

extension DomainsCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        actionsDelegate?.collectionViewSelectItemAt(indexPath: indexPath)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension DomainsCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 10, height: 40)
    }

}
