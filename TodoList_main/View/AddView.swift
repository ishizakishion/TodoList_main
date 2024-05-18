//
//  AddView.swift
//  TodoList_main
//
//  Created by 石崎汐音 on 2024/05/05.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var textfield : String = ""
    @EnvironmentObject var listViewModel : ListViewModel
    
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("typr of some here..", text: $textfield)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray)
                    .cornerRadius(10)
                
                Button{
                    saveButtonPressed()
                }label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    
                }
                
            }
            .padding(16)
            
        }
        .navigationTitle("やることを追加")
        .alert(isPresented: $showAlert, content:getAlert)
    }
    
    
    func saveButtonPressed(){
        if textIsAppAppropriate() {
            listViewModel.addItem(title: textfield)
            presentationMode.wrappedValue.dismiss()
        }
        
        
    }
    
    func textIsAppAppropriate() -> Bool {
        if textfield.count < 3 {
            
            alertTitle = "文字数が少ないです"
            showAlert.toggle()
            return false
        }
        return true
        
        
    }
    
    func getAlert()-> Alert {
        
        return Alert(title: Text(alertTitle))
    
    }
    
    
        
    
    
}

#Preview {
    NavigationView{
        AddView()
    }
    .environmentObject(ListViewModel())
}
