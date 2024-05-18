//
//  ItemModel.swift
//  TodoList_main
//
//  Created by 石崎汐音 on 2024/05/06.
//

import Foundation

//Immutable Struct  推奨されている

struct ItemModel : Identifiable, Codable{
    let id : String
    let title : String
    let isCompleted : Bool
    
    init(id:String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = UUID().uuidString
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel{
        return ItemModel ( id : id , title: title, isCompleted: !isCompleted)
    }
    
    
    
}



