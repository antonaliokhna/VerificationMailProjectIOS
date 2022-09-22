//
//  MailResponseViewModel.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/22/22.
//

import Foundation

class MailResponseViewModel: MailResponseViewModelType {
    private var mailResponseMocel: MailResponseModel

    init(mailResponseMocel: MailResponseModel) {
        self.mailResponseMocel = mailResponseMocel
    }

    func isDeliverable() -> Bool {
        return mailResponseMocel.deliverability.lowercased() == DeliverabilityStatuses.deliverable.rawValue
    }

    func getAutoCorrectMail() -> String? {
        let autocorrect = mailResponseMocel.autocorrect
        return autocorrect.isEmpty ? nil : autocorrect
    }

}
