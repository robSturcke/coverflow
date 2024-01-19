//
//  CoverFlowView.swift
//  CoverFlow
//
//  Created by Rob Sturcke on 1/12/24.
//

import SwiftUI

struct CoverFlowView<Content: View, Item: RandomAccessCollection>: View where Item.Element: Identifiable {
  var itemWidth: CGFloat
  var spacing: CGFloat = 0
  var rotation: Double
  var items: Item
  var content: (Item.Element) -> Content
  var body: some View {
    GeometryReader {
      let size = $0.size
      
      ScrollView(.horizontal) {
        LazyHStack(spacing: 0) {
          ForEach(items) { item in
            content(item)
              .frame(width: itemWidth)
          }
        }
        .padding(.horizontal, (size.width - itemWidth) / 2)
        .scrollTargetLayout()
      }
      .scrollTargetBehavior(.viewAligned)
      .scrollIndicators(.hidden)
    }
  }
}

struct CoverFlowItem: Identifiable {
  let id: UUID = .init()
  var color: Color
}

#Preview {
  ContentView()
}
