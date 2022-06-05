//
//  ModelData.swift
//  MojiMoku
//
//  Created by SIFT - Telkom DBT Air 5 on 31/05/22.
//

import Foundation
import Combine

class ModelData: ObservableObject {
    @Published var animeCharacters: [AnimeCharacter] = load("animeCharactersData.json")
    
    var categories: [String: [AnimeCharacter]] {
        Dictionary(
            grouping: animeCharacters,
            by: { $0.category.rawValue }
        )
    }
}

func load<T: Decodable>(_ filename: String) -> T{
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    }
    catch {
        fatalError("Couldn't find \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


/*
 {
"id": 666,
"anime_id": 90,
"anime_image": "https:/ /ami.animecharactersdatabase.com/productimages/90.jpg",
"character_image": "https:// ami.animecharactersdatabase.com/./images/maihime/Reito_thumb.jpg",
"origin": "Mai-HiME - The Genealogical Tree of Fate",
"gender": "Male",
"name": "Reito Kanzaki",
"desc": "Reito Kanzaki is a character from the visual novel Mai-HiME - The Genealogical Tree of Fate."
 }/**/*/
