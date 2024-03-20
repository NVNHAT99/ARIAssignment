//
//  HomeView.swift
//  ARIAssignment
//
//  Created by Nhat on 20/03/2024.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Variable
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    var body: some View {
        NavigationView(content: {
            VStack(content: {
                List {
                    ForEach(0..<viewModel.dataCount, id: \.self) { index in
                        NavigationLink(destination: FoodDetailView(foodData: viewModel.foodDetail(at: index))) {
                            HomeItemView(foodData: viewModel.foodDetail(at: index))
                        }
                        .listRowSeparator(.hidden)
                        .frame(height: 80)

                    }
                }
                .listStyle(.plain)
                .listRowSpacing(8)
            })
            .navigationTitle("List Food")
            .navigationBarTitleDisplayMode(.large)
        })
        .task {
            viewModel.send(intent: .fetchData)
        }
    }
}

#Preview {
    HomeView()
}
