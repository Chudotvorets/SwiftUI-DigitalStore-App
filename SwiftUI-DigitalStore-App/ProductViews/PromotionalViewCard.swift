//
//  PromotionalViewCard.swift
//  SwiftUI-DigitalStore-App
//
//  Created by dev on 24.08.2024.
//

import Foundation
import SwiftUI

struct PromotionalCarouselCard: View {
    let product: ProductModel
    var body: some View {
        ZStack{
            HStack {
                
                ProductCarouselImage(imageURL: product.imageURL)
                VStack(alignment: .leading){
                    Text(product.title)
                        .font(.subheadline)
                        .lineLimit(3)
                    Text("\(product.price.format(f: ".2"))$")
                        .bold()
                        .padding(4)
                    HStack(spacing: 2) {
                        Text("\(product.formatedRating)")
                            .font(.footnote)
                        Text("(\(product.rating.manualCount))")
                            .font(.caption)
                            .offset(y:2)
                    }
                }.foregroundColor(.black)
                Spacer()
            }
            //Color.secondaryBackground
                .blendMode(.overlay)
        }.frame(width: 180, height: 180, alignment: .top)
        .cornerRadius(18)
        //.shadow(color: .darkText.opacity(0.1), radius: 6, x: 1, y: 2)
    }
}

struct ProductCarouselCard_Previews: PreviewProvider {
    static var previews: some View {
        PromotionalCarouselCard(product: ProductModel.sampleProducts[19])
    }
}

struct ProductCarouselImage: View {
    @StateObject private var imageLoader = ImageLoader()
    let imageURL: URL
    var body: some View {
        ZStack{
            Rectangle()
                //.fill(Color.white)
                .frame(width: 120, height: 120, alignment: .leading)
                .cornerRadius(12)
                .overlay(
                    ZStack {
                        ProgressView()
                        if imageLoader.image != nil {
                            HStack {
                                Spacer()
                                Image(uiImage: imageLoader.image!)
                                    .resizable()
                                    .compositingGroup()
                                    .clipped(antialiased: true)
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .cornerRadius(12)
                                    .padding()
                                Spacer()
                            }
                        }
                    }
                )
        }
        .cornerRadius(12)
        .onAppear {
            imageLoader.loadImage(with: imageURL)
        }
    }
}
//#Preview {
//    PromotionalCarouselCard(product: ProductModel.sampleProducts[2])
//}

