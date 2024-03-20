//
//  HomeEnergyUsageAPIFetcher.swift
//  ARIAssignment
//
//  Created by Nhat on 20/03/2024.
//

import Foundation

protocol HomeAPIFetcherProtocol: AnyObject {
    func fetchData<T: Codable>(type: T.Type) async throws -> T
}

final class HomeAPIFetcher: BaseAPIFetcher {
    
}

extension HomeAPIFetcher: HomeAPIFetcherProtocol {
    func fetchData<T: Codable>(type: T.Type) async throws -> T {
        guard let url = URL(string: ServerConstant.APIPath.example) else {
            throw APIError.invalidURL
        }
        
        do {
            let data = try await networkService.requestAPI(url: url)
            let decodeData = try decodeData(data, type: type)
            return decodeData
        } catch {
            throw APIError.invalidResponse
        }
    }
    
}
