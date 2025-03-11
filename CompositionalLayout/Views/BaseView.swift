//
//  BaseView.swift
//  CompositionalLayout
//
//  Created by Ben Shutt on 05/03/2025.
//

import UIKit

class BaseView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("\(#function) has not been implemented")
  }

  func setup() {
    // Subclasses may override
  }
}
