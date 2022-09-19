//
//  VerificationModel.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/19/22.
//

import Foundation

struct VerificationModel {
    private let correctDomainAdress = ["@gmail.com", "@icloud.com", "@yahoo.com", "@yandex.ru", "@mail.ru"]

    var filteredDomains: [String] = []

    mutating func filterDomainsBy(mail text: String) {
        clearFilteredDomains()
        guard let firstIndex = text.firstIndex(of: "@") else { return }
        let endIndex = text.index(before: text.endIndex)
        let textRange = text[firstIndex...endIndex]
        let domain = String(textRange)

        filteredDomains = correctDomainAdress.filter { $0.contains(domain) }
    }

    mutating func clearFilteredDomains() {
        filteredDomains.removeAll()
    }
}
