//
//  ItemModel.swift
//  SwiftfulToDo
//
//  Created by Leon Grimmeisen on 08.07.22.
//

import Foundation

//Immutable struct because all variables are let
//If variables are vars they could change accidentally
//Thats why we make sure the data is consistent with immutable structs
struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        // initializiung like this gives us two option:
        // one with id and one without
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    // create a new item with the same id
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
