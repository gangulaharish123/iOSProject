//
//  KeychainService.swift
//  SampleiOSApp
//
//  Created by hgangula on 14/02/23.
//

import Security
import UIKit

class KeychainService: ServiceProtocol {

    /// Default KeychainService access
    public static let standard = KeychainService()
     
    /// #Set
    /// Stores the data in the keychain
    /// - Parameters:
    ///   - key: The  key to set the data
    ///   - data: The data to save
    /// - Returns: OSStatus value
    open func set(key: String, data: Data) -> OSStatus {
        let query = [
            kSecClass as String       : kSecClassGenericPassword as String,
            kSecAttrAccount as String : key,
            kSecValueData as String   : data ] as [String : Any]

        SecItemDelete(query as CFDictionary)
        return SecItemAdd(query as CFDictionary, nil)
    }

    
    /// #Get
    /// Get the data from the keychain
    /// - Parameter key: The  key to get the data
    /// - Returns: Data type
    open func get(key: String) -> Data? {
        let query = [
            kSecClass as String       : kSecClassGenericPassword,
            kSecAttrAccount as String : key,
            kSecReturnData as String  : kCFBooleanTrue!,
            kSecMatchLimit as String  : kSecMatchLimitOne ] as [String : Any]

        var dataTypeRef: AnyObject? = nil

        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == noErr {
            return dataTypeRef as! Data?
        } else {
            return nil
        }
    }
}
