//
//  CompositionalLayoutItem+Extensions.swift
//  CompositionalLayout
//
//  Created by Ben Shutt on 07/03/2025.
//

import CompositionalLayoutBuilder

extension CompositionalLayoutItem {
  static var reuseIdentifier: String {
    "\(Cell.self)"
  }
}
