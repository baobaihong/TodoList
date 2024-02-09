//
//  ListView.swift
//  TodoList
//
//  Created by Jason on 2024/2/7.
//

import SwiftUI

struct ListView: View {
    @Environment(ListViewModel.self) var listViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear(duration: 0.1)) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List📝")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                EditButton()
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink("Add", destination: AddView())
            }
        }
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
    .environment(ListViewModel())
}
