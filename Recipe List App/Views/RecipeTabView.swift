//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Joshua Curry on 8/22/21.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView {
            RecipeFeaturedView()
                .tabItem {
                    Label("Featured", systemImage: "star.fill")
                }
            RecipeListView()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
        }
        .environmentObject(RecipeViewModel())
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
