//
//  Insets.swift
//  CompositionalLayout
//
//  Created by Ben Shutt on 05/03/2025.
//

import UIKit

/// `Hashable` insets that maps to `NSDirectionalEdgeInsets`
struct Insets: Hashable {
  static let zero = Insets(top: 0, leading: 0, bottom: 0, trailing: 0)

  var top: CGFloat
  var leading: CGFloat
  var bottom: CGFloat
  var trailing: CGFloat

  var directional: NSDirectionalEdgeInsets {
    .init(
      top: top,
      leading: leading,
      bottom: bottom,
      trailing: trailing
    )
  }
}
