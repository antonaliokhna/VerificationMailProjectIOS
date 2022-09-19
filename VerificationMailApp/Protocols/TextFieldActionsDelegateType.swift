//
//  TextFieldDelegate.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/18/22.
//

import Foundation

protocol TextFieldActionsDelegateType: AnyObject {
    func textFieldShouldChange(mailAdress: String)
    func textFieldShouldClear()
}
