//
//  Lists.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Leon Grimmeisen on 02.07.22.
//

import SwiftUI

struct Lists: View {
    
    @State var fruits = [
        "apple", "orange", "banana", "peach"
    ]
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit.capitalized)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                    .listRowBackground(Color.red.opacity(0.8))
                    .foregroundColor(.white)
                } header: {
                    HStack {
                        Text("Fruits")
                        Image(systemName: "flame.fill")
                    }

                    .foregroundColor(.orange)
                }
            }
            .listStyle(DefaultListStyle())
            .navigationTitle("Fruitslist")
            .navigationBarItems(leading: EditButton(), trailing: addButton)
            .accentColor(.red)
                
        }
    }
    
    var addButton: some View {
        Button("Add") {
            fruits.append("Cocounut")
        }
    }
    
    func delete(indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }
    
    func move(indexSet: IndexSet, int: Int) {
        fruits.move(fromOffsets: indexSet, toOffset: int)
    }
    
}

struct Lists_Previews: PreviewProvider {
    static var previews: some View {
        Lists()
    }
}
