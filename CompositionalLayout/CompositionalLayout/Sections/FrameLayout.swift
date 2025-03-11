//
//  FrameLayout.swift
//  CompositionalLayout
//
//  Created by Ben Shutt on 05/03/2025.
//

import UIKit
import CompositionalLayoutBuilder

@MainActor
struct FrameLayout: CompositionalLayoutSectionProvider {
  var width: NSCollectionLayoutDimension
  var height: NSCollectionLayoutDimension
  var contentInsets: Insets = .zero

  func makeSection(
    in environment: any NSCollectionLayoutEnvironment
  ) -> NSCollectionLayoutSection {
    let section = NSCollectionLayoutSection(group: makeGroup(in: environment))
    section.contentInsets = contentInsets.directional
    return section
  }

  private func makeGroup(
    in environment: any NSCollectionLayoutEnvironment
  ) -> NSCollectionLayoutGroup {
    .vertical(
      layoutSize: .init(
        widthDimension: width,
        heightDimension: height
      ),
      subitems: [
        .init(layoutSize: .init(
          widthDimension: width,
          heightDimension: height
        ))
      ]
    )
  }
}
