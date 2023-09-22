//
//  AddDataView.swift
//  FileManagerDataFlowExample
//
//  Created by Leon Grimmeisen on 14.10.22.
//

import SwiftUI

struct AddDataView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var vm: ViewModel

    @State var dataModel: DataModel = DataModel(name: "New Data")

    
    var body: some View {
        TextField("Title", text: $dataModel.name)
        Button("Save") {
            vm.addData(dataModel: dataModel)
            dismiss()
        }
    }
}

struct AddDataView_Previews: PreviewProvider {
    static var previews: some View {
        AddDataView(dataModel: dev.dataOne)
    }
}
