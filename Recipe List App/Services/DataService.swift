//
//  DataService.swift
//  Recipe List App
//
//  Created by Joshua Curry on 8/13/21.
//

import Foundation

class DataService {
    static func getLocalData() -> [Recipe] {
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        if let pathString = pathString {
            let url = URL(fileURLWithPath: pathString)
            
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                
                do {
                    let recipeData = try decoder.decode([Recipe].self, from: data)
                    for r in recipeData {
                        r.id = UUID()
                        
                        // Add uniquie id to recipe ingredients
                        for i in r.ingredients {
                            i.id = UUID()
                        }
                    }
                    return recipeData
                } catch {
                    print(error.localizedDescription)
                }
            } catch {
                print(error.localizedDescription)
            }
            
        }
        return [Recipe]()
    }
}
