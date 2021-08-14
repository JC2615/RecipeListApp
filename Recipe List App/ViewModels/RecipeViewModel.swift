//
//  RecipeViewModel.swift
//  Recipe List App
//
//  Created by Joshua Curry on 8/13/21.
//

import Foundation

class RecipeViewModel: ObservableObject {
    @Published var recipes = [Recipe]()
    
    init(){
        self.recipes = DataService.getLocalData()
    }
}
