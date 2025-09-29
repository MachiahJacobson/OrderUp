//
//  Checkout.swift
//  OrderUp
//
//  Created by Jacobson, Machiah - Student on 9/24/25.
//

import SwiftUI

struct Checkout: View {
    var foodItems: [FoodItem]
    
    @State var name: String = ""
    @State private var toggleIsOn = true
    
    var body: some View {
        let (subtotal, tax, withTax) = totalPrice()
        let subtotalString = String(format: "$%.2f", subtotal)
         let taxString = String(format: "$%.2f", tax)
        let withTaxString = String(format: "$%.2f", withTax)
       Text("Details")
            .font(.title)
            .font(.headline)
            .fontDesign(.monospaced)
            .fontWeight(.bold)
            .padding()
        
        Spacer()
        
        TextField("Name", text: $name)
            .textFieldStyle(.roundedBorder)
            .font(.title2)
            .padding(.trailing)
            .padding(.leading)
        TextField("Phone Number", text: $name)
            .textFieldStyle(.roundedBorder)
            .font(.title2)
            .padding()
            .padding(.bottom)
        Toggle("Pay With Apple pay\(toggleIsOn ? "": ""):", isOn: $toggleIsOn)
            .padding(.leading)
            .padding(.trailing)
        Toggle("Deliver\(toggleIsOn ? "": ""):", isOn: $toggleIsOn)
            .padding()
        VStack {
            Text("Subtotal........................... \(subtotalString)")
            Text("Tax.....................................\(taxString) ")
            Text("Total price........................ \(withTaxString)")
        } .frame(maxWidth: .infinity, alignment: .init(horizontal: .trailing, vertical: .top))
            .padding()
        Spacer()
        
        Button {
        } label: {
                Text("Pay")
        } .buttonStyle(.borderedProminent)
        
    }
    
    func totalPrice() -> (Double, Double, Double) {
        //TODO: do real calculation on foodItems
        var total: Double = 0
        for item in foodItems {
            total += item.price * Double(item.numItems)
        }
        let tax = total * 0.0805
        let withTax: Double = total * 1.0805
        return (total, tax, withTax)
    }
}
#Preview {
    @Previewable @State var foodItems: [FoodItem] = [
        FoodItem (title: "Smothered Borrito(1)", imageName: "Smothered Burrito", price: 11.99, numItems: 3),
        FoodItem (title: "Carnitas Tacos (6)", imageName: "Carnitas", price: 12.99),
        FoodItem (title: "Enchilada (1)", imageName: "Enchalada", price: 11.99),
        FoodItem (title: "Churros (5)", imageName: "Churros", price: 9.99),
        FoodItem (title: "Fried Ice Cream (1)", imageName: "Fried Ice Cream", price: 8.99)   ]
    Checkout(foodItems: foodItems)
}
