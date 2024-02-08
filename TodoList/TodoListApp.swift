//
//  TodoListApp.swift
//  TodoList
//
//  Created by Jason on 2024/2/7.
//

import SwiftUI

@main
struct TodoListApp: App {
    @State var listViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
                .environment(listViewModel)
        }
    }
}
