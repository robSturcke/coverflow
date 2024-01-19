//
//  CoverFlowView.swift
//  CoverFlow
//
//  Created by Rob Sturcke on 1/12/24.
//

import SwiftUI

struct CoverFlowView<Content: View, Item: RandomAccessCollection>: View where Item.Element: Identifiable {
  var itemWidth: CGFloat
  var enableReflection: Bool = false
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
              .reflection(enableReflection)
          }
        }
        .padding(.horizontal, (size.width - itemWidth) / 2)
        .scrollTargetLayout()
      }
      .scrollTargetBehavior(.viewAligned)
      .scrollIndicators(.hidden)
      .scrollClipDisabled()
    }
  }
}

struct CoverFlowItem: Identifiable {
  let id: UUID = .init()
  var color: Color
}

fileprivate extension View {
  @ViewBuilder
  func reflection(_ added: Bool) -> some View {
    self
      .overlay {
        if added {
          GeometryReader {
            let size = $0.size
            
            self
              .scaleEffect(y: -1)
              .mask {
                Rectangle()
                  .fill(
                    .linearGradient(colors: [
                      .white,
                      .white.opacity(0.7),
                      .white.opacity(0.5),
                      .white.opacity(0.3),
                      .white.opacity(0.1),
                      .white.opacity(0),
                    ] + Array(repeating: Color.clear, count: 5), startPoint: .top, endPoint: .bottom)
                  )
              }
              .offset(y: size.height + 5)
              .opacity(0.5)
          }
        }
        
      }
  }
}

#Preview {
  ContentView()
}
