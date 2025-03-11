//
//  FlowLayout.swift
//  CompositionalLayout
//
//  Created by Ben Shutt on 05/03/2025.
//

import UIKit
import CompositionalLayoutBuilder

@MainActor
struct FlowLayout: CompositionalLayoutSectionProvider {
  var estimatedItemWidth: CGFloat
  var estimatedItemHeight: CGFloat
  var hSpacing: CGFloat
  var vSpacing: CGFloat
  var contentInsets: Insets

  func makeSection(
    in environment: any NSCollectionLayoutEnvironment
  ) -> NSCollectionLayoutSection {
    let section = NSCollectionLayoutSection(group: makeGroup(in: environment))
    section.interGroupSpacing = vSpacing
    section.contentInsets = contentInsets.directional
    return section
  }

  private func makeGroup(
    in environment: any NSCollectionLayoutEnvironment
  ) -> NSCollectionLayoutGroup {
    let item = NSCollectionLayoutItem(layoutSize: .init(
      widthDimension: .estimated(estimatedItemWidth),
      heightDimension: .estimated(estimatedItemHeight)
    ))
    let group = NSCollectionLayoutGroup.horizontal(
      layoutSize: .init(
        widthDimension: .fractionalWidth(1),
        heightDimension: .estimated(estimatedItemHeight)
      ),
      subitems: [item]
    )
    group.interItemSpacing = .fixed(hSpacing)
    return group
  }
}
