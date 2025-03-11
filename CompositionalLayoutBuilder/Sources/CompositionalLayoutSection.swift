//
//  CompositionalLayoutSection.swift
//  CompositionalLayout
//
//  Created by Ben Shutt on 05/03/2025.
//

import UIKit

@MainActor
public struct CompositionalLayoutSection<ID: CompositionalLayoutID>: IdentifiedHashable {
  public var id: ID
  public var provider: any CompositionalLayoutSectionProvider
  public var items: [AnyCompositionalLayoutItem]

  public init(
    id: ID,
    provider: any CompositionalLayoutSectionProvider,
    items: [AnyCompositionalLayoutItem]
  ) {
    self.id = id
    self.provider = provider
    self.items = items
  }
}

// MARK: - CompositionalLayoutSectionProvider + CompositionalLayoutSection

public extension CompositionalLayoutSectionProvider {
  func items<SectionID>(
    id: SectionID,
    @ItemBuilder items: () -> [AnyCompositionalLayoutItem]
  ) -> CompositionalLayoutSection<SectionID> {
    .init(id: id, provider: self, items: items())
  }
}
