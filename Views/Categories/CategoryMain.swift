//
//  CategoryMain.swift
//  MojiMoku
//
//  Created by SIFT - Telkom DBT Air 5 on 05/06/22.
//

import SwiftUI

struct CategoryMain: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        NavigationView {
            List {
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Explore")
        }
    }
}

struct CategoryMain_Previews: PreviewProvider {
    static var previews: some View {
        CategoryMain()
            .environmentObject(ModelData())
    }
}

