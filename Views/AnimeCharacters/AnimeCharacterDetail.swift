//
//  AnimeCharacterDetail.swift
//  MojiMoku
//
//  Created by SIFT - Telkom DBT Air 5 on 31/05/22.
//

import SwiftUI

struct AnimeCharacterDetail: View {
    @EnvironmentObject var modelData: ModelData
    var animeCharacter: AnimeCharacter
    
    var AnimeCharacterIndex: Int{
        modelData.animeCharacters.firstIndex(where: { $0.id == animeCharacter.id})!
    }
    
    var body: some View {
        ScrollView{
            VStack (alignment: .leading){
                VStack {
                    CircleImage(image: AsyncImage(url: URL(string: animeCharacter.character_image))).frame(width:150, height: 150).offset(y:10)
                    
                    FavoriteButton(isSet: $modelData.animeCharacters[AnimeCharacterIndex].isFavorite)
                    
                    Text(animeCharacter.name)
                        .font(.title)
                    
                    Text(animeCharacter.origin).font(.title2)
                }.frame(maxWidth: .infinity)
                
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(animeCharacter.name)")
                    .font(.title2)
                Text(animeCharacter.desc)
            }
            .padding()
        }
        .navigationTitle(animeCharacter.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AnimeDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        AnimeCharacterDetail(animeCharacter: ModelData().animeCharacters[0])
            .environmentObject(modelData)
    }
}
