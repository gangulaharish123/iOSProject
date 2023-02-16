//
//  ServiceProtocol.swift
//  SampleiOSApp
//
//  Created by hgangula on 16/02/23.
//

import Foundation

protocol ServiceProtocol {
    func set(key: String, data: Data) -> OSStatus
    func get(key: String) -> Data?
}
