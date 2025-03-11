//
//  IdentifiedHashable.swift
//  CompositionalLayout
//
//  Created by Ben Shutt on 05/03/2025.
//

public protocol IdentifiedHashable: Identifiable, Hashable {}

// MARK: - IdentifiedHashable + Extensions

public extension IdentifiedHashable {
  nonisolated func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }

  nonisolated static func == (lhs: Self, rhs: Self) -> Bool {
    lhs.id == rhs.id
  }
}
