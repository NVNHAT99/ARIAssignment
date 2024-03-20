//
//  HomeItemView.swift
//  ARIAssignment
//
//  Created by Nhat on 20/03/2024.
//

import SwiftUI

struct HomeItemView: View {
    // MARK: - Variables
    @Binding var foodData: FoodDetail
    var body: some View {
        VStack(content: {
            Spacer()
            HStack(content: {
                AsyncImage(url: URL(string: foodData.image ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                } placeholder: {
                    Text("loading")
                }
                Spacer()
                    .frame(width: 16)
                VStack(alignment: .leading, content: {
                    Text(foodData.name ?? "")
                        .font(.system(size: 18))
                    Text(foodData.headline ?? "")
                        .font(.system(size: 14))
                        .lineLimit(2)
                    Spacer()
                        .frame(height: 16)
                    VStack(alignment: .leading, spacing: 8, content: {
                        Text("Calories: \(foodData.calories ?? "")")
                            .font(.system(size: 14))
                        Text("Level: \(foodData.difficultyStr)")
                            .font(.system(size: 14))
                    })
                })
                Spacer()
            })
            
            Spacer()
            
            Divider()
                .frame(height: 1)
        })
        .padding(.leading, 4)
    }
}

#Preview {
    HomeItemView(foodData: .constant(.init(calories: "",
                                           carbos: "",
                                           description: "",
                                           difficulty: 0,
                                           fats: "",
                                           headline: "",
                                           id: "",
                                           image: "",
                                           name: "",
                                           proteins: "",
                                           thumb: "",
                                           time: "",
                                           country: "")))
}
