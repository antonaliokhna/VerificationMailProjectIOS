//
//  Networking.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/22/22.
//

import Foundation

protocol Networkign {
    func request(stringUrl: String, completion: @escaping (Data?, Error?) -> Void)
}
