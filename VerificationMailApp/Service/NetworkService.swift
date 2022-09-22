//
//  NetworkService.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/20/22.
//

import Foundation

class NetworkService: Networkign {

    func request(stringUrl: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: stringUrl) else { return }
        let request = URLRequest(url: url)
        let task = cteateDataTask(request: request, completion: completion)
        task.resume()
    }

    private func cteateDataTask(request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
