//
//  ContentView.swift
//  LoyaltyCompositionalLayout
//
//  Created by Ben Shutt on 03/03/2025.
//

import SwiftUI

struct CollectionView: UIViewControllerRepresentable {
  func makeUIViewController(context: Context) -> CollectionViewController {
    CollectionViewController()
  }

  func updateUIViewController(
    _ uiViewController: CollectionViewController,
    context: Context
  ) {}
}

// MARK: - Preview

#Preview {
  CollectionView()
}
