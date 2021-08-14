//
//  RecipeListView.swift
//  Recipe List App
//
//  Created by Joshua Curry on 8/13/21.
//

import SwiftUI

struct RecipeListView: View {
    
    @ObservedObject var model = RecipeViewModel()
    
    var body: some View {
        
        
        
        NavigationView {
            List(model.recipes){ r in
                
                NavigationLink(
                    destination: RecipeDetailView(recipe: r),
                    label: {
                        HStack(spacing: 20.0){
                            Image(r.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .clipped()
                                .cornerRadius(5.0)
                            Text(r.name)
                        }
                    })
                
                
            }
            .navigationTitle("All Recipes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
