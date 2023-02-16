//
//  PasswordViewModel.swift
//  SampleiOSApp
//
//  Created by hgangula on 15/02/23.
//

import Foundation
import UIKit

class StorageViewModel {
    let passwordRepository = StorageRepository()
    
    init() {
    }
    
    /// Validating Password
    /// It validates given password
    /// - Parameter password: The String value
    /// - Returns: Boolean value
    func isValidPassword(password: String) -> Bool {
        let passwordPredict = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$")
        return passwordPredict.evaluate(with: password)
    }
    
    ///  #LoadPassword
    /// - Returns: User data
    func loadPassword() -> User {
        return passwordRepository.loadData()
    }
    
    /// #SavePassword
    ///It saves the password with help of keychainService
    /// - Parameter user: User data
    func savePassword(user: User) {
        passwordRepository.saveData(user: user)
    }
}
