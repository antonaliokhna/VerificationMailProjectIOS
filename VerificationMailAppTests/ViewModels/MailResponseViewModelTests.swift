//
//  MailResponseViewModelTests.swift
//  VerificationMailAppTests
//
//  Created by Anton Aliokhna on 11/22/22.
//

import XCTest
@testable import VerificationMailApp

final class MailResponseViewModelTests: XCTestCase {

    var sut: MailResponseViewModel!

    override func setUpWithError() throws {
        let mailResponseModel = MailResponseModel(
            email: "antonaliokhna@gmail.com",
            autocorrect: "",
            deliverability: "deliverable"
        )

        sut = MailResponseViewModel(mailResponseMocel: mailResponseModel)
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testMailDeliverableReturnTrueWhenGiveCorrectMail() {
        XCTAssertTrue(sut.isDeliverable(), "isDeliverable returned not deliverable status")
    }

    func testGetAutoCorrectMailReturnNilWhenGiveCorrectMail() {
        XCTAssertNil(sut.getAutoCorrectMail(), "GetAutoCorrectMail returned not a nil")
    }
}
