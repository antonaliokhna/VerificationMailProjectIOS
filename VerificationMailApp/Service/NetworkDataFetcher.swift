//
//  NetworkDataFetcher.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/20/22.
//

import Foundation

class NetworkDataFetcher: DataFetcher {

    var networkService: Networkign

    init(networkService: Networkign = NetworkService()) {
        self.networkService = networkService
    }

    func fetchGenericJSONData<T: Decodable>(stringUrl: String, response: @escaping (T?) -> Void) {
        networkService.request(stringUrl: stringUrl) { data, error in
            if let error = error {
                print(error.localizedDescription)
                response(nil)
            }

            let decoded = self.decodeJSON(type: T.self, from: data)
            response(decoded)
        }
    }

    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        guard let data = from else { return nil }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        do {
            let object = try decoder.decode(type, from: data)
            return object
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
