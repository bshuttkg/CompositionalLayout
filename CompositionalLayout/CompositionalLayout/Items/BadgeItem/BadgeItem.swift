//
//  BadgeItem.swift
//  LoyaltyCompositionalLayout
//
//  Created by Ben Shutt on 03/03/2025.
//

import UIKit
import CompositionalLayoutBuilder

struct BadgeItem: CompositionalLayoutItem {
  var text: String

  func configure(
    cell: BadgeCollectionViewCell,
    for indexPath: IndexPath
  ) {
    cell.text = text
  }
}

// MARK: - ID

extension BadgeItem {
  nonisolated var id: String {
    "\(Self.self).\(text)"
  }
}
