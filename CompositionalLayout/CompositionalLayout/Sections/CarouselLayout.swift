//
//  CarouselLayout.swift
//  CompositionalLayout
//
//  Created by Ben Shutt on 07/03/2025.
//

import UIKit
import CompositionalLayoutBuilder

@MainActor
struct CarouselLayout: CompositionalLayoutSectionProvider {
  var width: NSCollectionLayoutDimension
  var height: NSCollectionLayoutDimension
  var hSpacing: CGFloat
  var contentInsets: Insets

  func makeSection(
    in environment: any NSCollectionLayoutEnvironment
  ) -> NSCollectionLayoutSection {
    let section = NSCollectionLayoutSection(group: makeGroup(in: environment))
    section.interGroupSpacing = hSpacing
    section.contentInsets = contentInsets.directional
    section.orthogonalScrollingBehavior = .continuous
    return section
  }

  private func makeGroup(
    in environment: any NSCollectionLayoutEnvironment
  ) -> NSCollectionLayoutGroup {
    .horizontal(
      layoutSize: .init(
        widthDimension: width,
        heightDimension: height
      ),
      subitems: [.init(layoutSize: .init(
        widthDimension: .fractionalWidth(1),
        heightDimension: .fractionalHeight(1)
      ))]
    )
  }
}
