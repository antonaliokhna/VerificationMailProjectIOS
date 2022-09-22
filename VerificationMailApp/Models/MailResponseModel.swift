//
//  MailResponseModel.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/20/22.
//

import Foundation

struct MailResponseModel: Codable {
    let email: String
    let autocorrect: String
    let deliverability: String
}
