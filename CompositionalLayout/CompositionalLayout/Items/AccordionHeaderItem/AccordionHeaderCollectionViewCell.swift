//
//  AccordionHeaderCollectionViewCell.swift
//  CompositionalLayout
//
//  Created by Ben Shutt on 05/03/2025.
//

import UIKit

final class AccordionHeaderCollectionViewCell: UICollectionViewListCell {
  private let label: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.font = .preferredFont(forTextStyle: .subheadline)
    label.lineBreakMode = .byTruncatingTail
    label.numberOfLines = 1
    label.textAlignment = .left
    return label
  }()

  private let hStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.spacing = 0
    stackView.axis = .horizontal
    stackView.alignment = .center
    stackView.distribution = .fill
    return stackView
  }()

  private let chevronView = ChevronView()

  // MARK: - API

  var text: String? {
    get { label.text }
    set { label.text = newValue }
  }

  var isExpanded: Bool {
    get { chevronView.isExpanded }
    set { chevronView.isExpanded = newValue }
  }

  // MARK: - Setup

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("\(#function) has not been implemented")
  }

  func setup() {
    hStackView.addArrangedSubview(label)
    hStackView.addArrangedSubview(chevronView)
    contentView.addSubview(hStackView)

    hStackView.constrainEdges(to: contentView, insets: .init(
      top: 5, left: 0, bottom: 5, right: 5
    ))
  }
}
