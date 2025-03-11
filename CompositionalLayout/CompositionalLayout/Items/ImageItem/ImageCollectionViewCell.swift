//
//  ImageCell.swift
//  LoyaltyCompositionalLayout
//
//  Created by Ben Shutt on 03/03/2025.
//

import UIKit

class ImageCollectionViewCell: BaseCollectionViewCell {
  let imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()

  // MARK: - API

  var image: UIImage? {
    get { imageView.image }
    set { imageView.image = newValue }
  }

  // MARK: - Setup

  override func setup() {
    contentView.addSubview(imageView)
    imageView.constrainEdges(to: contentView)

    contentView.clipsToBounds = true
  }
}
