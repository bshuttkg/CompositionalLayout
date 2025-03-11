//
//  PublishedValue.swift
//  CompositionalLayout
//
//  Created by Ben Shutt on 05/03/2025.
//

import Combine

/// A `@Published` property wrapper that fires on `didSet` rather than `willSet`.
@propertyWrapper
struct PublishedValue<Value> {
  private let subject: CurrentValueSubject<Value, Never>

  init(wrappedValue value: Value) {
    self.subject = .init(value)
  }

  var wrappedValue: Value {
    get {
      subject.value
    }
    nonmutating set {
      subject.value = newValue
    }
  }

  var projectedValue: AnyPublisher<Value, Never> {
    subject.eraseToAnyPublisher()
  }
}
