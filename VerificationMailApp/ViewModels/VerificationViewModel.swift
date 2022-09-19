//
//  VerificationViewModel.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/19/22.
//

import Foundation

class VerificationViewModel: VerificationViewModelType {

    private var verificationModel: VerificationModel

    init(verification model: VerificationModel = VerificationModel()) {
        self.verificationModel = model
    }

    func filteredDomains(by text: String) {
        verificationModel.filterDomainsBy(mail: text)
    }

    func getFilteredDomain(by indexPath: IndexPath) -> String {
        return verificationModel.filteredDomains[indexPath.row]
    }

    func getFilteredDomainsCount() -> Int {
        return verificationModel.filteredDomains.count
    }

    func clearFilteredDomains() {
        verificationModel.clearFilteredDomains()
    }

    func getFullMailAdress(by indexPath: IndexPath, currentAdress: String) -> String {
        verificationModel.fulterMailAdress(currentAdress: currentAdress)
        let mailAdress = verificationModel.filteredNameMailAdress
        let domain = getFilteredDomain(by: indexPath)
        clearFilteredDomains()
        return mailAdress + domain
    }
}
