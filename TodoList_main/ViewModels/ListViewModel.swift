//
//  ListViewModel.swift
//  TodoList_main
//
//  Created by 石崎汐音 on 2024/05/06.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items : [ItemModel] = []{
        
        didSet{
            saveItems()
        }
        
        
    }
    let itemsKey : String = "items_list"
    
    
    
    init(){
        getItems()
    }
    func getItems(){
        //        let newItems = [
        //            ItemModel(title: "一個め", isCompleted: false),
        //            ItemModel(title: "にこめ", isCompleted: true),
        //            ItemModel(title: "3個め", isCompleted: false)
        //        ]
        //        items.append(contentsOf: newItems)
        
        guard let data = UserDefaults.standard.data(forKey: itemsKey)else{return}
        guard let saveItems = try? JSONDecoder().decode([ItemModel].self, from: data)else{return}
        
    }
    
    func deleteItem(indexSet: IndexSet ){
        items.remove(atOffsets: indexSet)
        
        
    }
    
    func moveItem(from : IndexSet , to : Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem (title : String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
        
        
    }
    func updateItem(item: ItemModel){
        
        
        
        if let index = items.firstIndex (where : { $0.id == item.id}){
            items[index] = item.updateCompletion()
        }
        
        
        
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
            
        }
    }
    
    
    
}
