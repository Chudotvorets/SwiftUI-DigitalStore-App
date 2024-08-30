//
//  MainView.swift
//  SwiftUI-DigitalStore-App
//
//  Created by dev on 24.08.2024.
//

import SwiftUI

struct HomeView: View {
    let array = [1,2,3,4,5,6,7,8,9,10]
    var text = "View"
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical) {
                    VStack {
                        
                    }
                    
                }
                
            }
            
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: LoadingBarItem(), trailing: TrailingBarItem())
         
        }
        //.statusBar(hidden: false)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode:.always))
    }
}



struct TrailingBarItem: View {
    var body: some View {
//        Text("hello")
//            .font(.title)
        Image(systemName: "message")
    }
}
struct LoadingBarItem: View {
    
    var body: some View {
        Text("ул.Самарская 2")
    }
}

//struct SearchBar: View {
//    @Binding var text: String
//
//    @State private var isEditing = false
//
//    var body: some View {
//        HStack {
//
//            TextField("Найти товар", text: $text)
//                .padding(7)
//                .padding(.horizontal, 25)
//                .background(Color(.systemGray6))
//                .cornerRadius(8)
//                .padding(.horizontal, 10)
//                .onTapGesture {
//                    self.isEditing = true
//                }
//
//            if isEditing {
//                Button(action: {
//                    self.isEditing = false
//                    self.text = ""
//
//                }) {
//                    Text("Cancel")
//                }
//                .padding(.trailing, 10)
//                .transition(.move(edge: .trailing))
//                .animation(.default)
//            }
//        }
//    }
//}
#Preview {
    HomeView()
}
