//
//  VerificationViewControllerTests.swift
//  VerificationMailAppTests
//
//  Created by Anton Aliokhna on 11/21/22.
//

import XCTest
@testable import VerificationMailApp

final class DomainsCollectionViewTests: XCTestCase {

    var sut: DomainsCollectionView!

    override func setUpWithError() throws {
        sut = DomainsCollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testCorrectLoadDomainsCollectionView() {
        XCTAssertNotNil(sut)
    }

    func testCorrectSetCollectionViewDelegateWhenViewLoad() {
        XCTAssertNotNil(sut.delegate)
    }

    func testCorrectSetCollectionViewBackroundColorWhenViewLoad() {
        XCTAssert(sut.backgroundColor == .none)
    }

    func testCallActionDelegateAfterSelectItemAtIndexPathInDomainsCollectionView() {
        let mockActionsDelegate = MockCollectionViewActionsDelegate()
        sut.actionsDelegate = mockActionsDelegate

        sut.collectionView(sut, didSelectItemAt: IndexPath(item: 0, section: 0))

        XCTAssertTrue(mockActionsDelegate.collectionViewSelectItemAtCalled)
    }

    //MARK: - MockCollectionViewActionsDelegate
    final class MockCollectionViewActionsDelegate: CollectionViewActionsDelegateType {
        var collectionViewSelectItemAtCalled = false

        func collectionViewSelectItemAt(indexPath: IndexPath) {
            collectionViewSelectItemAtCalled = true
        }
    }
}
