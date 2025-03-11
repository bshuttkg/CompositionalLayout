//
//  ImageItem.swift
//  LoyaltyCompositionalLayout
//
//  Created by Ben Shutt on 03/03/2025.
//

import UIKit
import Kingfisher
import CompositionalLayoutBuilder

struct ImageItem: CompositionalLayoutItem {
  var imageURL: URL

  func configure(
    cell: ImageCollectionViewCell,
    for indexPath: IndexPath
  ) {
    cell.image = nil
    cell.backgroundColor = .lightGray

    cell.imageView.kf.cancelDownloadTask()
    cell.imageView.kf.indicatorType = .activity
    cell.imageView.kf.setImage(
      with: imageURL,
      options: [
        .loadDiskFileSynchronously,
        .cacheOriginalImage,
        .transition(.fade(0.25)),
      ]
    )
  }
}

// MARK: - ID

extension ImageItem {
  nonisolated var id: String {
    "\(Self.self).\(imageURL)"
  }
}
