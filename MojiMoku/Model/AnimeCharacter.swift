//
//  AnimeCharacter.swift
//  MojiMoku
//
//  Created by SIFT - Telkom DBT Air 5 on 31/05/22.
//

import Foundation
import SwiftUI

struct AnimeCharacter: Hashable, Codable, Identifiable {
    var id: Int
    var anime_id: Int
    var anime_image: String
    var character_image: String
    var origin: String
    var gender: String
    var name: String
    var desc: String
    var isFavorite: Bool
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case discover = "Discover"
        case newly = "Newly Added"
        case waifu = "Waifuable"
        case popular = "Most Popular"
    }
}
