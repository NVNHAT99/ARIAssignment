//
//  NetworkServiceProtocol.swift
//  ARIAssignment
//
//  Created by Nhat on 20/03/2024.
//

import Foundation

protocol NetworkServiceProtocol {
    func requestAPI(url: URL) async throws -> Data
}
