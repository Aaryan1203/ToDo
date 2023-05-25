//
//  ContentView.swift
//  To-Do
//
//  Created by Aaryan Jain on 5/22/23.
//

import SwiftUI

struct ListItem: Identifiable {
    
    var id:UUID = UUID()
    var text:String =  ""
}

struct ListItemView: View {
    @Binding var ListItem: ListItem
    @State var buttonPressed:Bool = false
    
    var body: some View {
        HStack {
            Button {
                buttonPressed.toggle()
            } label: {
                Image(buttonPressed ? "check" : "emptyCheck")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            .buttonStyle(PlainButtonStyle())
            
            TextField("List Item", text: $ListItem.text)
                .font(.title2)
        }
    }
}

struct ContentView: View {
    @State var toDoItems = [ListItem()]
    
    var body: some View {
        VStack {
            HStack {
                Text("To-Do List")
                    .font(.title)
                Image("check")
                    .resizable()
                    .aspectRatio(contentMode: .fit )
                    .frame(width: 30.0, height: 30)
            }
            List {
                ForEach(toDoItems.indices, id: \.self) { index in
                    
                    HStack {
                        ListItemView(ListItem: $toDoItems[index])
                    }
                    
                }
                .padding()
            }
        }
        .padding()
        
        Spacer()
        HStack {
            Spacer(minLength: 0)
            Button(action: {
                toDoItems.append(ListItem())
            }) {
                HStack {
                    Text("New Item")
                        .font(.title2)
                    Image("check")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
            .buttonStyle(PlainButtonStyle())
            .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
