//
//  CoverFlowView.swift
//  CoverFlow
//
//  Created by Rob Sturcke on 1/12/24.
//

import SwiftUI

struct CoverFlowView<Content: View, Item: RandomAccessCollection>: View where Item.Element: Identifiable {
  var itemWidth: CGFloat
  var items: Item
  var content: (Item.Element) -> Content
  var body: some View {
    ScrollView(.horizontal) {
      LazyHStack(spacing: 0) {
        ForEach(items) { item in
          content(item)
            .frame(width: itemWidth)
        }
      }
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
