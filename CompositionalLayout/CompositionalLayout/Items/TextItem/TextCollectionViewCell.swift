//
//  TextCollectionViewCell.swift
//  CompositionalLayout
//
//  Created by Ben Shutt on 06/03/2025.
//

import UIKit

class TextCollectionViewCell: BaseCollectionViewCell {
  private let label: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.font = .preferredFont(forTextStyle: .body)
    label.lineBreakMode = .byTruncatingTail
    label.numberOfLines = 0
    label.textAlignment = .left
    return label
  }()

  private var edgeConstraints: EdgeConstraints!

  // MARK: - API

  var text: String? {
    get { label.text }
    set { label.text = newValue }
  }

  var insets: UIEdgeInsets {
    get { edgeConstraints.insets }
    set { edgeConstraints.insets = newValue }
  }

  // MARK: - Setup

  override func setup() {
    contentView.addSubview(label)
    edgeConstraints = label.constrainEdges(to: contentView)
  }
}
