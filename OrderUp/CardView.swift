//
//  CardView.swift
//  OrderUp
//
//  Created by Jacobson, Machiah - Student on 9/22/25.
//

import SwiftUI

struct CardView: View {
    @Binding var item: FoodItem
    
    var body: some View {
        let fmtPrice = String(format: "$%.2f", item.price)
        VStack {
            HStack {
                Image(item.imageName)
                    .resizable()
                    .aspectRatio(contentMode: ContentMode.fill)
                    .frame(width: 130, height: 130)
                    .cornerRadius(10)
                    .padding(.trailing)
                VStack(alignment: .leading) {
                    Text(item.title)
                    Text(fmtPrice)
                    Text("x\(item.numItems)")
                    Button("Add to order") {
                        item.numItems += 1
                    }
                }
            }
         }
        .padding()
        .frame(width: 300, height: 150)
        .cornerRadius(30)
        .background(Color(white: 0.9))
    }
}

#Preview {
    @Previewable @State var item: FoodItem = FoodItem(title: "Smothered Burrito (2)", imageName: "Smothered Burrito", price: 11.99)
    CardView(item: $item)
}
