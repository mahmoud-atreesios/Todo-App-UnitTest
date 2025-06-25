//
//  NavBarView.swift
//  ToDoList
//
//  Created by Omar AbdElrazek on 01/06/2025.
//

import SwiftUI

struct NavBarView: View {
    
    @State private var searchText = ""
    
    var body: some View {
        HStack {
            Text("My Notes")
                .font(.system(size: 25, weight: .bold))
                .foregroundStyle(Color.textColor)
            
            Spacer()
            
            Image("person1")
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
        }
        
        searchBar()
        
    }
}

extension NavBarView {
    private func searchBar() -> some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.searchColor)
                .frame(height: 50)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.leading, 10)
                Spacer()
            }
            
            TextField(text: $searchText) {
                HStack {
                    Text("Search")
                        .font(.system(size: 16))
                }
                .foregroundStyle(Color.textColor)
            }
            .padding(.leading, 40)
        }
    }
}

#Preview {
    NavBarView()
}
