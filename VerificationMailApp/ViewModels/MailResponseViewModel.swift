//
//  MailResponseViewModel.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/22/22.
//

import Foundation

class MailResponseViewModel: MailResponseViewModelType {

    private var mailResponseModel: MailResponseModel

    init(mailResponseMocel: MailResponseModel) {
        self.mailResponseModel = mailResponseMocel
    }

    func isDeliverable() -> Bool {
        return mailResponseModel.deliverability.lowercased() == DeliverabilityStatuses.deliverable.rawValue
    }

    func getAutoCorrectMail() -> String? {
        let autocorrect = mailResponseModel.autocorrect
        return autocorrect.isEmpty ? nil : autocorrect
    }

}
