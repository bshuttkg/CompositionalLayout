//
//  TextItem.swift
//  CompositionalLayout
//
//  Created by Ben Shutt on 06/03/2025.
//

import UIKit
import CompositionalLayoutBuilder

struct TextItem: CompositionalLayoutItem {
  var text: String

  func configure(
    cell: TextCollectionViewCell,
    for indexPath: IndexPath
  ) {
    cell.text = text
  }
}

// MARK: - ID

extension TextItem {
  nonisolated var id: String {
    "\(Self.self).\(text)"
  }
}
