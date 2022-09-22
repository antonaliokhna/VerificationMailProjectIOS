//
//  MailResponseViewModelType.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/22/22.
//

import Foundation

protocol MailResponseViewModelType {
    func isDeliverable() -> Bool
    func getAutoCorrectMail() -> String?
}
