//
//  CategoryHome.swift
//  MojiMoku
//
//  Created by SIFT - Telkom DBT Air 5 on 05/06/22.
//

import SwiftUI

struct CategoryItem: View {
    var anime: AnimeCharacter
    
    var body: some View {
        VStack(alignment: .leading) {
            CircleImage(image: AsyncImage(url: URL(string: anime.character_image)))
            VStack(alignment: .center) {
                        Text(anime.name)
                            .foregroundColor(.primary)
                            .bold()
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                            .lineLimit(2)
                            .frame(maxWidth:200, minHeight:75, maxHeight:75, alignment: .init(horizontal: .center, vertical: .center))
                            .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        Text(anime.origin)
                            .foregroundColor(.purple)
                            .font(.title2)
                            .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                            .lineLimit(1)
                            .frame(maxWidth:200, minHeight:50, maxHeight:50, alignment: .init(horizontal: .center, vertical: .center))
                            .fixedSize(horizontal: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        
                        Spacer()
                    }        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(anime: ModelData().animeCharacters[0])
    }
}

