//
//  ChevronView.swift
//  CompositionalLayout
//
//  Created by Ben Shutt on 05/03/2025.
//

import UIKit

final class ChevronView: BaseView {
  private lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = chevron.image
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()

  private var chevron: Chevron = .down {
    didSet {
      imageView.image = chevron.image
    }
  }

  var isExpanded: Bool {
    get { chevron.isExpanded }
    set { chevron.isExpanded = newValue }
  }

  override func setup() {
    addSubview(imageView)
    imageView.constrainSize(width: 15, height: 7.5)
    imageView.constrainEdges(to: self, insets: .init(
      top: 11.25, left: 7.25, bottom: 11.25, right: 7.25
    ))
  }
}

// MARK: - Chevron

enum Chevron: String {
  case down = "chevron.down"
  case up = "chevron.up"

  var isExpanded: Bool {
    get { self == .up }
    set { self = newValue ? .up : .down }
  }

  var image: UIImage? {
    .init(systemName: rawValue)
  }
}
