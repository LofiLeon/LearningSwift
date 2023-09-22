//
//  DetailViewViewModel.swift
//  FileManagerDataFlowExample
//
//  Created by Leon Grimmeisen on 14.10.22.
//

import Foundation

class DetailViewViewModel: ObservableObject {
    
    @Published var data: DataModel
    
    init(data: DataModel) {
        self.data = data
    }

}
