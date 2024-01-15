//
//  ContentView.swift
//  CoverFlow
//
//  Created by Rob Sturcke on 1/12/24.
//

import SwiftUI

struct ContentView: View {
  @State private var items: [CoverFlowItem] = [.red, .blue, .green, .yellow, .primary].compactMap{
    return .init(color: $0)
  }
  var body: some View {
    NavigationStack {
      VStack {
        CoverFlowView(itemWidth: 280, items: items)  { item in
            RoundedRectangle(cornerRadius: 20)
            .fill(item.color.gradient)
        }
        .frame(height: 180)
      }
      .navigationTitle("CoverFlow")
    }
    .preferredColorScheme(.dark)
  }
}

#Preview {
  ContentView()
}
