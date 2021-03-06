//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Joshua Curry on 8/13/21.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe
    @State var selectedServingSize = 2
    var body: some View {
        ScrollView {
            
            VStack(alignment: .leading) {
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                // MARK: Recipe Title
                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(Font.custom("Avenir Heavy", size: 24))
                
                // MARK: Serving Sice Picker
                VStack(alignment: .leading) {
                    Text("Select your serving size:")
                        .font(Font.custom("Aevenir", size: 15))
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .font(Font.custom("Aevenir", size: 15))
                    .pickerStyle(SegmentedPickerStyle())
                }
                .padding()
                
                
                // MARK: Ingredients
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(Font.custom("Aevenir Heavy", size: 16))
                        .padding([.bottom, .top], 5)
                    ForEach(recipe.ingredients){ item in
                        Text("- " + RecipeViewModel.getPortion(ingredient: item, recipeServingSize: recipe.servings, targetServingSize: selectedServingSize) + " " + item.name.lowercased())
                            .font(Font.custom("Aevenir", size: 15))
                    }
                }
                .padding(.horizontal)
                
                // MARK: Divider
                Divider()
                
                // MARK: Direction
                VStack(alignment: .leading){
                    Text("Directions")
                        .font(Font.custom("Aevenir Heavy", size: 16))
                        .padding([.bottom, .top], 5)
                    ForEach(0..<recipe.directions.count, id: \.self){ index in
                        Text("\(index + 1). \(recipe.directions[index])")
                            .padding(.bottom, 5)
                            .font(Font.custom("Aevenir", size: 15))
                    }
                }
                .padding(.horizontal)
            }
            
            
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeViewModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
