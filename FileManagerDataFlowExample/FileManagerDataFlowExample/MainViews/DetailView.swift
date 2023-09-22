////
////  DetailView.swift
////  FileManagerDataFlowExample
////
////  Created by Leon Grimmeisen on 14.10.22.
////

import SwiftUI

struct DetailView: View {

    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: ViewModel

    @State var dataModel: DataModel
    
    @State private var isEditing: Bool = false

    var body: some View {
        NavigationView {
            if isEditing {
                TextField("Title", text: $dataModel.name)
            } else {
                Text(dataModel.name)
            }
        }
        .toolbar {
            Button {
                isEditing.toggle()
                if !isEditing {
                    vm.updateData(data: dataModel)
                }
            } label: {
                Text(isEditing ? "Done" : "Edit")
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(dataModel: dev.dataOne)
    }
}
