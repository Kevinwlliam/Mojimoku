//
//  AnimeCharsRow.swift
//  MojiMoku
//
//  Created by SIFT - Telkom DBT Air 5 on 31/05/22.
//

import SwiftUI

struct AnimeCharsRow: View {
    var animeChar: AnimeCharacter
    
    var body: some View {
        HStack(alignment: .bottom) {
            RoundedCorners(color: .yellow, tl: 30, tr: 0, bl: 0, br: 30)
                .frame(maxWidth: 4.2, maxHeight: 1)
                .scaleEffect(60)
                .offset(x:170, y:-20)
            
            CircleImage(image: animeChar.image)
                .frame(width: 90, height: 90)
                .scaleEffect(0.4)
                .offset(x:-3, y:5)
    
            VStack(alignment: .leading) {
                Text(animeChar.name)
                    .bold()
                    .truncationMode(/*@START_MENU_TOKEN@*/.tail/*@END_MENU_TOKEN@*/)
                    .lineLimit(1)
                    .frame(maxWidth:180, minHeight:25, alignment: .init(horizontal: .leading, vertical: .center))
                    .offset(x:-5)
                Text(animeChar.origin)
                    .foregroundColor(.purple)
                    .truncationMode(.tail)
                    .lineLimit(1)
                    .frame(maxWidth:195, minHeight:25, alignment: .init(horizontal: .leading, vertical: .center))
                    .offset(x:-15)
            }
            .fixedSize(horizontal: false, vertical: true)
            
        }
        .frame(maxWidth:300, maxHeight:90, alignment: .init(horizontal: .leading, vertical: .bottom))
        .cornerRadius(10)
        
    
        
    }
}

struct AnimeCharsRow_Previews: PreviewProvider {
    static var animeChars = ModelData().animeChars
    static var previews: some View {
        Group {
            AnimeCharsRow(animeChar: animeChars[0])
            AnimeCharsRow(animeChar: animeChars[6])
        }
        .previewLayout(.fixed(width: 300, height: 100))
    }
}
