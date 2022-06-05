//
//  AnimeCharacterRow.swift
//  MojiMoku
//
//  Created by SIFT - Telkom DBT Air 5 on 31/05/22.
//

import SwiftUI

struct AnimeCharacterRow: View {
    var animeCharacter: AnimeCharacter
    
    var body: some View {
        HStack(alignment: .center) {
            CircleImage(image: AsyncImage(url: URL(string: animeCharacter.character_image))).scaleEffect(0.5).frame(width: 125, height: 125)
            
            VStack(alignment: .leading) {
                Text(animeCharacter.name)
                    .bold()
                Text(animeCharacter.origin).bold()
            }
            
            Spacer()
            
        }
        .padding(.vertical, 4)
    }
}

struct AnimeCharacterRow_Previews: PreviewProvider {
    static var animeCharacter = ModelData().animeCharacters
    
    static var previews: some View {
        Group {
            AnimeCharacterRow(animeCharacter: animeCharacter[0])
            AnimeCharacterRow(animeCharacter: animeCharacter[5])
        }
        .previewLayout(.fixed(width: 300, height: 120))
    }
}

