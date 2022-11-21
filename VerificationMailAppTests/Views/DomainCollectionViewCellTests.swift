//
//  DomainsCollectionViewCellTests.swift
//  VerificationMailAppTests
//
//  Created by Anton Aliokhna on 11/22/22.
//

import XCTest
@testable import VerificationMailApp

final class DomainCollectionViewCellTests: XCTestCase {

    var sut: DomainCollectionViewCell!

    override func setUpWithError() throws {
        let collectionView = DomainsCollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
        sut = collectionView.dequeueReusableCell(
            withReuseIdentifier: "domainCell", for: IndexPath(row: 0, section: 0)) as? DomainCollectionViewCell
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testInitDomainCollectionViewCellWhenLoadController() {
        XCTAssertNotNil(sut, "DomainCollectionViewCell failed inited when load controller")
    }

    func testDomainCollectionViewCellComposedOfLabel() {
        XCTAssertNotNil(sut.domainLabel, "DomainCollectionViewCell under test is not composed of a UILabel")
    }

    func testChangeCellTitleTextWhenSetTitleDomainCollectionViewCell() {
        let title = "Some title"

        sut.setTitle(text: title)

        XCTAssert(sut.domainLabel.text == title)
    }
}
