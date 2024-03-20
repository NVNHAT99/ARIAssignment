//
//  HomeViewModel.swift
//  ARIAssignment
//
//  Created by Nhat on 21/03/2024.
//

import Foundation
import SwiftUI

final class HomeViewModel: ObservableObject {
    @Published private(set) var state: HomeViewState
    
    private let apiFetcher: HomeAPIFetcherProtocol
    
    init(state: HomeViewState = HomeViewState(listFood: []),
         apiFetcher: HomeAPIFetcherProtocol = HomeAPIFetcher()) {
        self.state = state
        self.apiFetcher = apiFetcher
    }
}

// MARK: - Handle logic of screen and action here
extension HomeViewModel {
    func send(intent: HomeViewIntent) {
        switch intent {
        case .fetchData:
            fetchData()
        }
    }
    
    private func fetchData() {
        Task {
            do {
                let responseAPI = try await apiFetcher.fetchData(type: [FoodDetail].self)
                await MainActor.run { [weak self] in
                    guard let self = self else {
                        return
                    }
                    var tempState = self.state
                    tempState.listFood = responseAPI
                    tempState.isLoadedData = true
                    self.state = tempState
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

extension HomeViewModel {
    var dataCount: Int {
        return state.listFood.count
    }
}

// MARK: - binding data
extension HomeViewModel {
    func foodDetail(at index: Int) -> Binding<FoodDetail> {
        return Binding<FoodDetail>(
            get: { self.state.listFood[index] },
            set: { _ in
            }
        )
    }
}
