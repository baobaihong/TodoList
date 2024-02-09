//
//  ListViewModel.swift
//  TodoList
//
//  Created by Jason on 2024/2/7.
//

import Foundation

@Observable class ListViewModel {
    var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    let itemKeys = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard 
            let data = UserDefaults.standard.data(forKey: itemKeys),
            let newItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        items = newItems
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.setValue(encodedData, forKey: itemKeys)
        }
    }
}
