//
//  Data.swift
//  FileManagerDataFlowExample
//
//  Created by Leon Grimmeisen on 13.10.22.
//

import Foundation

struct DataModel: Identifiable, Codable, Equatable {
    
    let id: UUID
    var name: String

    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
    
    func updateCompletion() -> DataModel {
        return DataModel(id: id, name: name)
    }
    
}
