//
//  AccordionHeaderItem.swift
//  CompositionalLayout
//
//  Created by Ben Shutt on 05/03/2025.
//

import UIKit
import CompositionalLayoutBuilder

struct AccordionHeaderItem: CompositionalLayoutItem {
  var text: String
  var isExpanded: Bool
  var didSelect: () -> Void

  func configure(
    cell: AccordionHeaderCollectionViewCell,
    for indexPath: IndexPath
  ) {
    cell.text = text
    cell.isExpanded = isExpanded

    // TODO: For built-in header accordion
    // cell.accessories = [.outlineDisclosure(
    //   options: .init(
    //     style: .header,
    //     tintColor: .darkGray
    //   )
    // )]
  }
}

// MARK: - ID

extension AccordionHeaderItem {
  nonisolated var id: String {
    "\(Self.self).\(text).\(isExpanded)"
  }
}
