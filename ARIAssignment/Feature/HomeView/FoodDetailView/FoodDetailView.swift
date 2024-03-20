//
//  FoodDetailView.swift
//  ARIAssignment
//
//  Created by Nhat on 21/03/2024.
//

import SwiftUI

struct FoodDetailView: View {
    // MARK: - Variables
    @Binding var foodData: FoodDetail
    
    var body: some View {
        GeometryReader(content: { geometry in
            VStack(content: {
                AsyncImage(url: URL(string: foodData.image ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width,
                               height: 400)
                } placeholder: {
                    Image(systemName: "xbox.logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width,
                               height: 400)
                }
                VStack(spacing: 24, content: {
                    Text(foodData.name ?? "")
                        .font(.title2)
                    Text(foodData.description  ?? "")
                })
                Spacer()
            })
            .ignoresSafeArea(.all, edges: .bottom)
        })
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    FoodDetailView(foodData: .constant(.init(calories: "",
                                             carbos: "",
                                             description: "",
                                             difficulty: 0,
                                             fats: "",
                                             headline: "",
                                             id: "",
                                             image: "",
                                             name: "this is food name",
                                             proteins: "",
                                             thumb: "",
                                             time: "",
                                             country: "")))
}
