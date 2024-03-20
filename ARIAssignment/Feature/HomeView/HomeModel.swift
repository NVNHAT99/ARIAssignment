//
//  HomeModel.swift
//  ARIAssignment
//
//  Created by Nhat on 21/03/2024.
//

import Foundation

struct FoodDetail: Codable, Hashable {
    let calories, carbos, description: String?
    let difficulty: Int?
    let fats, headline, id: String?
    let image: String?
    let name, proteins: String?
    let thumb: String?
    let time: String?
    let country: String?
    
    var difficultyStr: String {
        guard let difficulty = difficulty else{
            return "Easy"
        }
        
        switch difficulty {
        case 0:
            return "Easy"
        case 1:
            return "Moderate"
        case 2:
            return "Difficult"
        case 3:
            return "Very Difficult"
        case 4:
            return "Expert"
        default:
            return "Easy"
        }
    }
}
