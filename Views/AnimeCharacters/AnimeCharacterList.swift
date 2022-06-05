//
//  AnimeCharacterList.swift
//  MojiMoku
//
//  Created by SIFT - Telkom DBT Air 5 on 31/05/22.
//

import SwiftUI

struct AnimeCharacterList: View {
    @EnvironmentObject var modelData: ModelData
    
    var filteredAnimeCharacter: [AnimeCharacter]{
        modelData.animeCharacters.filter{animeCharacter in (animeCharacter .isFavorite)
        }
    }
    
    var body: some View{
        NavigationView{
            List{
                ForEach(filteredAnimeCharacter){ animeCharacter in
                    NavigationLink (
                        destination: AnimeCharacterDetail(animeCharacter: animeCharacter)
                    )
                    {
                        AnimeCharacterRow(animeCharacter: animeCharacter)
                    }
                }
            }
            .navigationTitle("Favorite Characters")
        }
    }
    
}

struct AnimeCharacterList_Previews: PreviewProvider {
    static var previews: some View {
        AnimeCharacterList()
            .environmentObject(ModelData())
    }
}

