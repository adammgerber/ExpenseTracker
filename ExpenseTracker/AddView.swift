//
//  AddView.swift
//  ExpenseTracker
//
//  Created by Adam Gerber on 06/11/2022.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    @ObservedObject var expenses: Expenses
    
    let types = ["Business", "Personal"]
    
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Name", text: $name)
                Picker ("Type", selection: $type) {
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar{
                Button("Save") {
                    let item = ExpenseItem(name: name, type: type, amount: amount)
                    expenses.items.append(item)
                    dismiss()
                }
                
            }
            
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
