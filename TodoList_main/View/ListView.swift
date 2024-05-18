//
//  ListView.swift
//  TodoList_main
//
//  Created by 石崎汐音 on 2024/05/04.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel : ListViewModel
    
    
    
    
    var body: some View {
        List{
            ForEach(listViewModel.items){ item in
               ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear){
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("ToDo リスト")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("追加", destination:AddView())
            
            
        )
        
        
        
        
        
    }
    
   
    
    
    
    
}

#Preview {
    NavigationView{
        ListView()
    }
    .environmentObject(ListViewModel())
}


