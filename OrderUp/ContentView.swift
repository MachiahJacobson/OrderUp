//
//  ContentView.swift
//  OrderUp
//
//  Created by Jacobson, Machiah - Student on 9/22/25.
//

import SwiftUI

struct FoodItem: Identifiable {// Identifiable needed for 'ForEach'
    var id: UUID = UUID() // Universally Unique Identifier - 128 value
    var title: String
    var imageName: String
    var price: Double
    var numItems: Int = 0 // Items with default initialization do not have to be included when creating
}
    
struct ContentView: View {
    
    @State var foodItems: [FoodItem] = [
        FoodItem (title: "Smothered Borrito (1)", imageName: "Smothered Burrito", price: 11.99),
        FoodItem (title: "Carnitas Tacos (6)", imageName: "Carnitas", price: 12.99),
        FoodItem (title: "Enchilada (1)", imageName: "Enchalada", price: 11.99),
        FoodItem (title: "Churros (5)", imageName: "Churros", price: 9.99),
        FoodItem (title: "Fried Ice Cream (1)", imageName: "Fried Ice Cream", price: 8.99)
    ]
    
    var body: some View {
        NavigationStack { // Allows Navigation bar and also switching to other screens
            VStack {
                Text ("Welcome to Order Up!")
                ScrollView {
                    VStack {
                        ForEach($foodItems) { $item in
                            //Text(item.title)
                            CardView (item: $item)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Order Up!")
            .font(.headline)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        CartView(foodItems: foodItems)
                    } label: {
                        Image(systemName: "cart")
                    }

//                    NavigationLink("Cart", destination:
//                                    CartView(foodItems: foodItems))
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
