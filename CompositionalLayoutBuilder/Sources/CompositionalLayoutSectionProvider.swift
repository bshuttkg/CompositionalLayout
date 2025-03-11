//
//  CompositionalLayoutSectionProvider.swift
//  CompositionalLayout
//
//  Created by Ben Shutt on 06/03/2025.
//

import UIKit

@MainActor
public protocol CompositionalLayoutSectionProvider {
  func makeSection(
    in environment: any NSCollectionLayoutEnvironment
  ) -> NSCollectionLayoutSection
}
