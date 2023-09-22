//
//  ListView.swift
//  FileManagerDataFlowExample
//
//  Created by Leon Grimmeisen on 14.10.22.
//

import SwiftUI

struct ListView: View {
    
    @StateObject private var vm = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.savedData) { dataModel in
                    NavigationLink {
                        DetailView(dataModel: dataModel)
                            .environmentObject(vm)
                    } label: {
                        Text(dataModel.name)
                    }
                }
                .onDelete(perform: vm.delete)
                .onMove(perform: vm.moveData)
            }
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                   EditButton()
                }
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    addButton
                }
            }
        }
    }
}

extension ListView {
    
    private var addButton: some View {
        // create a new Data Model and open its Detail View
        NavigationLink {
            AddDataView()
                .environmentObject(vm)
        } label: {
            Image(systemName: "plus.circle.fill")
                .resizable()
                .frame(width: 30, height: 30)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
