//
//  PromotionalViewCard.swift
//  SwiftUI-DigitalStore-App
//
//  Created by dev on 24.08.2024.
//

import Foundation
import SwiftUI

struct PromotionalCarouselCard: View {
    var body: some View {
    NavigationView {
        ZStack {
            ScrollView {
                   VStack(alignment: .leading) {
                         Text("Product title")
                             .font(.subheadline)
                             .lineLimit(3)
                   }
                }
            }
        }
    }
}
#Preview() {
    PromotionalCarouselCard()
}
