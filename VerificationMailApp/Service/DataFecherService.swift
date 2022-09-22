//
//  DataFecherService.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/20/22.
//

import Foundation

class DataFecherService {

    var dataFetcher: DataFetcher

    init(dataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.dataFetcher = dataFetcher
    }

    func fetchVerificationMailData(mailAdress: String, completion: @escaping (MailResponseViewModelType?) -> Void) {
        let stringUrl = "https://emailvalidation.abstractapi.com/v1/?api_key=\(ServiceAPIConfiguration.apiKey.rawValue)&email=\(mailAdress)"
        let response = { (mailResponseModel: MailResponseModel?) in
            guard let mailResponseModel = mailResponseModel else {
                completion(nil)
                return
            }
            completion(MailResponseViewModel(mailResponseMocel: mailResponseModel))
        }
        dataFetcher.fetchGenericJSONData(stringUrl: stringUrl, response: response)
    }
}
