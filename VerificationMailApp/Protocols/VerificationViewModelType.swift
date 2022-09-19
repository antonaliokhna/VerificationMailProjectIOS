//
//  VerificationViewModelType.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/19/22.
//

import Foundation

protocol VerificationViewModelType: AnyObject {
    func filteredDomains(by text: String)
    func getFilteredDomain(by indexPath: IndexPath) -> String
    func getFilteredDomainsCount() -> Int
    func clearFilteredDomains()
}
