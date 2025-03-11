//
//  CompositionalLayoutItems.swift
//  CompositionalLayout
//
//  Created by Ben Shutt on 10/03/2025.
//

import CompositionalLayoutBuilder

struct CompositionalLayoutItems {
  static let all: [any CompositionalLayoutItem.Type] = [
    AccordionHeaderItem.self,
    BadgeItem.self,
    ImageItem.self,
    TextItem.self,
    CardItem.self
  ]
}
