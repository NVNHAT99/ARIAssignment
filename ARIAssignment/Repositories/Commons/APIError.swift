//
//  APIError.swift
//  ARIAssignment
//
//  Created by Nhat on 20/03/2024.
//

import Foundation

public enum APIError: Error {
    case other
    case decodeFailed
    case invalidResponse
    case invalidURL
}
