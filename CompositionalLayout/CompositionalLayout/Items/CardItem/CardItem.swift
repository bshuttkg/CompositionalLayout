//
//  CardItem.swift
//  CompositionalLayout
//
//  Created by Ben Shutt on 07/03/2025.
//

import UIKit
import CompositionalLayoutBuilder
import Kingfisher

struct CardItem: CompositionalLayoutItem {
  var imageURL: URL

  func configure(
    cell: CardCollectionViewCell,
    for indexPath: IndexPath
  ) {
    ImageItem(imageURL: imageURL)
      .configure(cell: cell, for: indexPath)
  }
}

// MARK: - ID

extension CardItem {
  nonisolated var id: String {
    "\(Self.self).\(imageURL)"
  }
}
