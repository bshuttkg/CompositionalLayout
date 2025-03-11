//
//  BadgeCollectionViewCell.swift
//  LoyaltyCompositionalLayout
//
//  Created by Ben Shutt on 03/03/2025.
//

import UIKit

final class BadgeCollectionViewCell: TextCollectionViewCell {
  var cornerRadius: CGFloat {
    get { contentView.layer.cornerRadius }
    set { contentView.layer.cornerRadius = newValue }
  }

  var badgeColor: UIColor? {
    get { contentView.backgroundColor }
    set { contentView.backgroundColor = newValue }
  }

  // MARK: - Setup

  override func setup() {
    super.setup()

    contentView.clipsToBounds = true
    contentView.layer.cornerCurve = .continuous
    cornerRadius = 5
    badgeColor = .lightGray
    insets = .init(top: 5, left: 10, bottom: 5, right: 10)
  }
}
