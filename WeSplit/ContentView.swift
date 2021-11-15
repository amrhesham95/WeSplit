//
//  ContentView.swift
//  WeSplit
//
//  Created by Amr Hesham on 29/10/2021.
//

import SwiftUI

struct ContentView: View {
    let tipPercentages = 0..<101
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @State private var amountIsFocused: Bool = false
    
    let tipPercentageWord = "How much tip do you want to leave?"
    
    var body: some View {
        NavigationView {
            Form {
                
                // Check section (amount and number of ppl)
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
//                        .focusedValue(\.[amountIsFocused], amountIsFocused)
                    
                    Picker("Number Of People: ", selection: $numberOfPeople) {
                        ForEach(2..<100, id: \.self) {
                            Text("\($0) people")
                        }
                    }
                }
                
                
                // Tip Section
                Section(header: Text("How much tip do you want to leave?")) {
                    
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self) {
                            Text("\($0) %")
                        }
                    }
                }
                
                //  Amount per person Section
                Section(header: Text("Amount per person")) {
                    
                }
                
                //  total amount for the check Section
                Section(header: Text("total amount for the check")) {
                    
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: ToolbarItemPlacement.confirmationAction) {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
