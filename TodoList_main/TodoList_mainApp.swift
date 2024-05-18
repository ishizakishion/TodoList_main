//
//  TodoList_mainApp.swift
//  TodoList_main
//
//  Created by 石崎汐音 on 2024/05/04.
//

import SwiftUI

@main
struct TodoList_mainApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
