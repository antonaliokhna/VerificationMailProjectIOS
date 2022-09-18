//
//  CollectionViewActionsDelegateType.swift
//  VerificationMailApp
//
//  Created by Anton Aliokhna on 9/18/22.
//

import Foundation

protocol CollectionViewActionsDelegateType: AnyObject {
    func collectionViewSelectItemAt(indexPath: IndexPath)
}
