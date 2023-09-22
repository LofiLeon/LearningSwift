//
//  Sheets.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Leon Grimmeisen on 01.07.22.
//

import SwiftUI

struct Sheet1: View {
    
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
            
            Button {
                showSheet.toggle()
            } label: {
                Text("Button")
                    .foregroundColor(.blue)
                    .font(.headline)
                    .padding(20)
                    .background(Color.white.cornerRadius(10))
            }
            // only add one sheet OR fullScreenCover per View!
            // Do not add logic to the sheets! It does not work correctly
//            .sheet(isPresented: $showSheet) {
//                Sheet2()
//            }
            .fullScreenCover(isPresented: $showSheet) {
                Sheet2()
            }
            
        }
    }
}

struct Sheet2: View {
    
    //Add this to dismiss the sheet and call it with presentationMode.wrappedValue.dismiss()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack (alignment: .topTrailing) {
            Color.red
                .ignoresSafeArea()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding(20)
            }
        }
    }
}

struct Sheets_Previews: PreviewProvider {
    static var previews: some View {
        Sheet1()
    }
}
