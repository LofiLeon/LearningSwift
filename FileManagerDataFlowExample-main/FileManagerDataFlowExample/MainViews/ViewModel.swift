//
//  ViewModel.swift
//  FileManagerDataFlowExample
//
//  Created by Leon Grimmeisen on 13.10.22.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published private(set) var savedData: [DataModel]
    @Published var selectedDataModel: DataModel?
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedData")
    
    init() {
        do {
            let data = try Data(contentsOf: savePath)
            savedData = try JSONDecoder().decode([DataModel].self, from: data)
        } catch {
            savedData = []
        }
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(savedData)
            try data.write(to: savePath, options: [.atomicWrite, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
    
    func addData(dataModel: DataModel) {
        savedData.append(dataModel)
        save()
    }
    
    func updateData(data: DataModel) {
        if let index = savedData.firstIndex(where: {$0.id == data.id}) {
            savedData[index] = data.updateCompletion()
        }
        save()
    }
    
    func moveData(at offsets: IndexSet, to int: Int) -> Void {
        savedData.move(fromOffsets: offsets, toOffset: int)
        save()
    }
    
    func delete(indexSet: IndexSet) {
        savedData.remove(atOffsets: indexSet)
        save()
    }
    
}
