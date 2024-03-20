//
//  NetworkService.swift
//  ARIAssignment
//
//  Created by Nhat on 20/03/2024.
//

import Foundation

struct NetworkService: NetworkServiceProtocol {
    func requestAPI(url: URL) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw APIError.invalidResponse
        }
        
        return data
    }
}
