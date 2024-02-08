//
//  ListRowView.swift
//  TodoList
//
//  Created by Jason on 2024/2/7.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ListRowView(item: ItemModel(title: "This is the first item!", isCompleted: true))
}

#Preview(traits: .sizeThatFitsLayout) {
    ListRowView(item: ItemModel(title: "This is the second!", isCompleted: false))
}
