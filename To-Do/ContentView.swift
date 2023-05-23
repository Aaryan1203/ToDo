//
//  ContentView.swift
//  To-Do
//
//  Created by Aaryan Jain on 5/22/23.
//

import SwiftUI


struct ContentView: View {
    @State var toDoItems: [String] = [""]
    @State var text: String = ""
    var body: some View {
        VStack {
            HStack {
                Text("To-Do List")
                    .font(.title)
                Image("check")
                    .resizable()
                    .aspectRatio(contentMode: .fit )
                    .frame(width: 35.0, height: 35)
            }
            ForEach (toDoItems.indices, id: \.self) {index in
                HStack {
                    Button(" ") {
                        
                    }
                    .padding(.horizontal)
                    TextField("Next Item", text: $text )
                    Spacer()
                }
            }

            Spacer()
            HStack {
                Spacer(minLength: 0)
                Button("New list") {
                    toDoItems.append("")
                }
                Image("check")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
