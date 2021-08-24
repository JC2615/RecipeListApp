//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Joshua Curry on 8/22/21.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model: RecipeViewModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Featured Review")
                .bold()
                .padding(.leading)
                .padding(.top, 40)
                .font(Font.custom("Avenir Heavy", size: 24))
            
            GeometryReader { geo in
                TabView(selection: $tabSelectionIndex) {
                    ForEach(0..<model.recipes.count){ index in
                        if model.recipes[index].featured {
                            
                            Button(action: {
                                self.isDetailViewShowing = true
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                        
                                    
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .font(Font.custom("Aevenir", size: 15))
                                            .padding(5)
                                    }
                                }

                            })
                            .tag(index)
                            .sheet(isPresented: $isDetailViewShowing, content: {
                                RecipeDetailView(recipe: model.recipes[index])
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time:")
                    .font(Font.custom("Aevenir Heavy", size: 16))
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("Aevenir", size: 15))
                Text("Highlight")
                    .font(Font.custom("Aevenir Heavy", size: 16))
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
            }
            .padding([.leading, .bottom])
        }
        .onAppear {
            setFeaturedIndex()
        }
    }
    
    func setFeaturedIndex() {
        let index = model.recipes.firstIndex { recipe in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeViewModel())
    }
}
