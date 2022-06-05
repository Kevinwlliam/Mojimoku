//
//  CategoryRow.swift
//  MojiMoku
//
//  Created by SIFT - Telkom DBT Air 5 on 05/06/22.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [AnimeCharacter]
    var body: some View {
        VStack (alignment: .leading){
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { animeCharacter in
                        NavigationLink (
                            destination: AnimeCharacterDetail(animeCharacter: animeCharacter)
                        )
                        {
                            CategoryItem(anime: animeCharacter)
                        }
                        .scaleEffect(0.5)
                        .frame(minWidth:150, maxWidth:150, minHeight:200, maxHeight:200)
                    }
                }
            }
            .frame(minHeight: 150, maxHeight: 200)
        }
    }

struct CategoryRow_Previews: PreviewProvider {
    static var anime = ModelData().animeCharacters
    
    static var previews: some View {
        CategoryRow(
            categoryName: anime[0].category.rawValue,
            items: Array(anime.prefix(4))
        )
    }
}
}
