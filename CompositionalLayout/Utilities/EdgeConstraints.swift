//
//  EdgeConstraints.swift
//  LoyaltyCompositionalLayout
//
//  Created by Ben Shutt on 03/03/2025.
//

import UIKit

@MainActor
struct EdgeConstraints {
  var top: NSLayoutConstraint
  var leading: NSLayoutConstraint
  var bottom: NSLayoutConstraint
  var trailing: NSLayoutConstraint

  var constraints: [NSLayoutConstraint] {
    [top, leading, bottom, trailing]
  }

  var insets: UIEdgeInsets {
    get {
      .init(
        top: top.constant,
        left: leading.constant,
        bottom: -bottom.constant,
        right: -trailing.constant
      )
    }
    nonmutating set {
      top.constant = newValue.top
      leading.constant = newValue.left
      bottom.constant = -newValue.bottom
      trailing.constant = -newValue.right
    }
  }
}

// MARK: - UIView + EdgeConstraints

extension UIView {
  private func makeEdgeConstraints(to view: UIView) -> EdgeConstraints {
    .init(
      top: topAnchor.constraint(equalTo: view.topAnchor),
      leading: leadingAnchor.constraint(equalTo: view.leadingAnchor),
      bottom: bottomAnchor.constraint(equalTo: view.bottomAnchor),
      trailing: trailingAnchor.constraint(equalTo: view.trailingAnchor)
    )
  }

  @discardableResult
  func constrainEdges(
    to view: UIView,
    insets: UIEdgeInsets = .zero
  ) -> EdgeConstraints {
    translatesAutoresizingMaskIntoConstraints = false
    let edgeConstraints = makeEdgeConstraints(to: view)
    edgeConstraints.insets = insets
    NSLayoutConstraint.activate(edgeConstraints.constraints)
    return edgeConstraints
  }
}
