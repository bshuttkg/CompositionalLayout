//
//  SizeConstraints.swift
//  CompositionalLayout
//
//  Created by Ben Shutt on 05/03/2025.
//

import UIKit

@MainActor
struct SizeConstraints {
  var width: NSLayoutConstraint
  var height: NSLayoutConstraint

  var constraints: [NSLayoutConstraint] {
    [width, height]
  }

  var size: CGSize {
    get {
      .init(
        width: width.constant,
        height: height.constant
      )
    }
    nonmutating set {
      width.constant = newValue.width
      height.constant = newValue.height
    }
  }
}

// MARK: - UIView + SizeConstraints

extension UIView {
  private func makeSizeConstraints(
    width: CGFloat,
    height: CGFloat
  ) -> SizeConstraints {
    .init(
      width: widthAnchor.constraint(equalToConstant: width),
      height: heightAnchor.constraint(equalToConstant: height)
    )
  }

  @discardableResult
  func constrainSize(
    width: CGFloat,
    height: CGFloat
  ) -> SizeConstraints {
    translatesAutoresizingMaskIntoConstraints = false
    let sizeConstraints = makeSizeConstraints(width: width, height: height)
    NSLayoutConstraint.activate(sizeConstraints.constraints)
    return sizeConstraints
  }
}
