//
//  ListRowView.swift
//  SwiftfulToDo
//
//  Created by Leon Grimmeisen on 07.07.22.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var exampleItem1 = ItemModel(title: "Example 1", isCompleted: false)
    static var exampleItem2 = ItemModel(title: "Example 2", isCompleted: true)

    static var previews: some View {
        Group {
            ListRowView(item: exampleItem1)
            ListRowView(item: exampleItem2)
        }
        .previewLayout(.sizeThatFits)
    }
}
