//
//  CartView.swift
//  OrderUp
//
//  Created by Jacobson, Machiah - Student on 9/22/25.
//

import SwiftUI

struct CartView: View {
    var foodItems: [FoodItem]
    @State private var name = ""
    var body: some View {
        let (totalPrice, withTax) = totalPrice()
        let totalPriceString = String(format: "$%.2f", totalPrice)
        let withTaxString = String(format: "$%.2f", withTax)
        HStack {
            Image(systemName: "cart")
                .font(.title)
                .font(.headline)
            Text("Your Cart")
                .font(.title)
                .font(.headline)
        } .padding()
            .fontDesign(.monospaced)
            .fontWeight(.bold)
        ScrollView(.vertical, showsIndicators: false) {
        ForEach(foodItems) { item in
            // Image(item.imageName)
            if item.numItems > 0 {
                HStack {
                    Image(item.imageName)
                        .resizable()
                        .aspectRatio(contentMode: ContentMode.fill)
                        .cornerRadius(10)
                        .frame(width: 100, height: 100)
                        .padding(.trailing, 40)
                    Text(item.title + " x \(item.numItems)")
                        .frame(width: 100, height: 100)
                        .font(.headline)
                }
                .padding(.top)
                }
            }
        }
        Spacer()
//        VStack {
//            Text("With Tax.............................. \(withTaxString)")
//            Text("Total price........................... \(totalPriceString)")
//        } .frame(maxWidth: .infinity, alignment: .trailing)
//        .padding()
        NavigationLink {
        Checkout(foodItems: foodItems)
        } label: {
            Text("Checkout")
        } .buttonStyle(.borderedProminent)
    }
    
    func totalPrice() -> (Double, Double) {
        //TODO: do real calculation on foodItems
        var total: Double = 0
        for item in foodItems {
            total += item.price * Double(item.numItems)
        }
        let withTax: Double = total * 1.0805
        return (total, withTax)
    }
}
#Preview {
    @Previewable @State var foodItems: [FoodItem] = [
        FoodItem (title: "Smothered Borrito(1)", imageName: "Smothered Burrito", price: 11.99, numItems: 3),
        FoodItem (title: "Carnitas Tacos (6)", imageName: "Carnitas", price: 12.99),
        FoodItem (title: "Enchilada (1)", imageName: "Enchalada", price: 11.99),
        FoodItem (title: "Churros (5)", imageName: "Churros", price: 9.99),
        FoodItem (title: "Fried Ice Cream (1)", imageName: "Fried Ice Cream", price: 8.99)   ]
    CartView(foodItems: foodItems)
}
