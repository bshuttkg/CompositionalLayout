//
//  ArrayBuilder.swift
//  CompositionalLayout
//
//  Created by Ben Shutt on 05/03/2025.
//

// MARK: - ArrayBuilder

@MainActor
public protocol ArrayBuilder {
  associatedtype Input
  associatedtype Output

  static func map(input: Input) -> Output
}

// MARK: - ArrayBuilder + ResultBuilder

public extension ArrayBuilder {
  static func buildOptional(_ component: [Output]?) -> [Output] {
    component ?? []
  }

  static func buildEither(first component: [Output]) -> [Output] {
    component
  }

  static func buildEither(second component: [Output]) -> [Output] {
    component
  }

  static func buildBlock(_ components: [Output]...) -> [Output] {
    buildArray(components)
  }

  static func buildExpression(_ expression: Input) -> [Output] {
    [map(input: expression)]
  }

  static func buildExpression(_ expression: [Input]) -> [Output] {
    expression.flatMap { buildExpression($0) }
  }

  static func buildArray(_ components: [[Output]]) -> [Output] {
    components.flatMap { $0 }
  }
}

// MARK: - ItemBuilder

@resultBuilder
public struct ItemBuilder: ArrayBuilder {
  public static func map(
    input: any CompositionalLayoutItem
  ) -> AnyCompositionalLayoutItem {
    input.erase()
  }
}

// MARK: - SectionBuilder

@resultBuilder
public struct SectionBuilder<ID: CompositionalLayoutID>: ArrayBuilder {
  public static func map(
    input: CompositionalLayoutSection<ID>
  ) -> CompositionalLayoutSection<ID> {
    input
  }
}
