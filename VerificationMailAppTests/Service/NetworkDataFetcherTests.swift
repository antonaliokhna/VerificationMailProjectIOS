//
//  NetworkDataFetcherTests.swift
//  VerificationMailAppTests
//
//  Created by Anton Aliokhna on 11/22/22.
//

import XCTest
@testable import VerificationMailApp

final class NetworkDataFetcherTests: XCTestCase {

    var sut: NetworkDataFetcher!

    override func setUpWithError() throws {
        sut = NetworkDataFetcher()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testParsingJSONDataFromApi() {
        sut.networkService = MockCorrectMailReponseModelNetworkServise()

        sut.fetchGenericJSONData(stringUrl: "") { (mailResponseModel: MailResponseModel?) in
            XCTAssertNotNil(mailResponseModel, "fetchGenericJSONData returned nil")
        }
    }

    final class MockCorrectMailReponseModelNetworkServise: Networkign {
        func request(stringUrl: String, completion: @escaping (Data?, Error?) -> Void) {
            let mailResponseModel = MailResponseModel(
                email: "antonaliokhna@gmail.com",
                autocorrect: "",
                deliverability: "deliverable"
            )

            let data = try? JSONEncoder().encode(mailResponseModel)
            completion(data, nil)
        }
    }
}
