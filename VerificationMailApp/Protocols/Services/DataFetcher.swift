//
//  DataFetcher.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/22/22.
//

import Foundation

protocol DataFetcher {
    func fetchGenericJSONData<T: Decodable>(stringUrl: String, response: @escaping (T?) -> Void)
}
