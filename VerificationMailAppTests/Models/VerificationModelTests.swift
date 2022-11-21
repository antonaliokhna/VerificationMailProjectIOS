//
//  VerificationModelTests.swift
//  VerificationMailAppTests
//
//  Created by Anton Aliokhna on 9/24/22.
//

import XCTest
@testable import VerificationMailApp

final class VerificationModelTests: XCTestCase {

    var sut: VerificationModel!

    override func setUpWithError() throws {
        sut = VerificationModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testInitVerificationModelWitchoutParameters() {
        XCTAssertNotNil(sut)
    }

    func testCalculatingTheCorrectFilteredDomainsForAnIncompleteGmailAddress() {
        let correctAdress = "@gmail.com"
        let incompleteAddress = "foo@gma"

        sut.filterDomainsBy(mail: incompleteAddress)

        XCTAssert(sut.filteredDomains.first == correctAdress)
    }

    func testEmptyFilteredDomainsWhenGivenCorrectDddress() {
        let icloudDomain = "@icloud.com"
        let correctAdress = "foo\(icloudDomain)"

        sut.filterDomainsBy(mail: correctAdress)

        XCTAssert(sut.filteredDomains.isEmpty)
    }

    func testMailAddressFilteringWithoutDomainWhenFullMailAdress() {
        let domain = "@gmail.com"
        let mail = "foo"
        let fullAdress = mail + domain

        sut.fulterMailAdress(currentAdress: fullAdress)

        XCTAssert(sut.filteredNameMailAdress == mail)
    }

    func testMailAddressEmptyWhenGivenMailWitchoutDomain() {
        let mail = "foo"

        sut.fulterMailAdress(currentAdress: mail)

        XCTAssert(sut.filteredNameMailAdress.isEmpty)
    }

    func testFilteredDomainsEmptyWhenCleaning() {
        sut.filteredDomains = ["@gmail.com", "@yandex.com"]

        sut.clearFilteredDomains()

        XCTAssert(sut.filteredDomains.isEmpty)
    }
}
