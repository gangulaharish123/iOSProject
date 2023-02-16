//
//  PasswordRepository.swift
//  SampleiOSApp
//
//  Created by hgangula on 15/02/23.
//

import Foundation

protocol StorageProtocol {
    func saveData(user: User)
    func loadData() -> User
}

class StorageRepository: StorageProtocol {
    
    /// # saveData
    /// It instantiate the wrapper classes and call respective services
    /// - Parameter user: User data
    func saveData(user: User) {
        let data = Data(user.password.utf8)
        let status = KeychainService.standard.set(key: Constants.passwordStorageKey, data: data)
        print("status: ", status)
    }
    
    /// #loadData
    /// It instantiate the wrapper classes and call respective services
    /// - Returns: User Data
    func loadData() -> User {
        var user: User = User(password: "")
        if let receivedData = KeychainService.standard.get(key: Constants.passwordStorageKey) {
            let result = String(decoding: receivedData, as: UTF8.self)
            user.password = result
        }
        return user
    }
}
