//
//  AnimeCharsDetail.swift
//  MojiMoku
//
//  Created by SIFT - Telkom DBT Air 5 on 31/05/22.
//

import SwiftUI

struct AnimeCharsDetail: View {
    @EnvironmentObject var modelData: ModelData
    var animeChar: AnimeCharacter
    
    var animeCharIndex: Int {
        modelData.animeChars.firstIndex(where: { $0.id == animeChar.id })!
    }
    
    var body: some View {
        VStack {
            DetailImage(animeChar: animeChar)
            FavoriteButton(isSet: $modelData.animeChars[animeCharIndex].isFavorite)
            
            VStack(alignment: .center) {
                Text(animeChar.name)
                    .bold()
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(animeChar.origin)
                    .font(.title2)
                    .foregroundColor(.purple)
                
                Divider()
            }
            .frame(maxWidth: .infinity)
            
            ScrollView {
                VStack(alignment: .leading) {
                    
                    Text("Description")
                        .bold()
                        .font(.title2)
                        .foregroundColor(.purple)
                    
                    ScrollView {
                        Text(animeChar.desc)
                    }.frame(maxHeight: .infinity)
                }
                .padding()
            }
        }
        
    }
}

struct AnimeCharsDetail_Previews: PreviewProvider {
    static var previews: some View {
        AnimeCharsDetail(animeChar: ModelData().animeChars[1])
            .environmentObject(ModelData())
    }
}
