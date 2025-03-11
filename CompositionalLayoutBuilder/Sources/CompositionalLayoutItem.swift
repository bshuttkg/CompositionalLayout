//
//  CompositionalLayoutItem.swift
//  CompositionalLayout
//
//  Created by Ben Shutt on 05/03/2025.
//

import UIKit

@MainActor
public protocol CompositionalLayoutItem: Identifiable {
  associatedtype Cell: UICollectionViewCell
  static var reuseIdentifier: String { get }

  var id: String { get }
  var didSelect: () -> Void { get }

  func configure(
    cell: Cell,
    for indexPath: IndexPath
  )
}

// MARK: - CompositionalLayoutItem + Extensions

public extension CompositionalLayoutItem {
  static func registerCell(collectionView: UICollectionView) {
    collectionView.register(
      Cell.self,
      forCellWithReuseIdentifier: reuseIdentifier
    )
  }

  var didSelect: () -> Void {
    {} // Be default, do nothing
  }

  func dequeueAndConfigureCell(
    collectionView: UICollectionView,
    for indexPath: IndexPath
  ) -> Cell {
    let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: Self.reuseIdentifier,
      for: indexPath
    ) as! Cell
    configure(cell: cell, for: indexPath)
    return cell
  }

  func erase() -> AnyCompositionalLayoutItem {
    .init(self)
  }
}

// MARK: - AnyCompositionalLayoutItem

/// An erased `CompositionalLayoutItem`
@MainActor
public struct AnyCompositionalLayoutItem: IdentifiedHashable {
  public var id: String
  public var didSelect: () -> Void
  public var item: any CompositionalLayoutItem

  public init<Item: CompositionalLayoutItem>(_ item: Item) {
    self.id = item.id
    self.didSelect = item.didSelect
    self.item = item
  }
}
