//
//  StringExtension.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/19/22.
//

import Foundation

extension String {
    func isValidMailAdress() -> Bool {
        let format = "SELF MATCHES %@"
        let regEx = "[a-zA-Z0-9]+@[a-zA-Z]+\\.[a-zA-Z]{2,}"
        return NSPredicate(format: format, regEx).evaluate(with: self)
    }
}
