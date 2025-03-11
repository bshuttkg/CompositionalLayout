//
//  Future+Task.swift
//  LoyaltyCompositionalLayout
//
//  Created by Ben Shutt on 03/03/2025.
//

import Combine

// TODO: Creator of unstructured task is responsible for its lifecycle, e.g. cancellation

extension Future where Failure == Error {
  convenience init(operation: @escaping @Sendable () async throws -> sending Output) {
    self.init { promise in
      let promise = SendablePromise(promise: promise)
      Task {
        do {
          let output = try await operation()
          promise.promise(.success(output))
        } catch {
          promise.promise(.failure(error))
        }
      }
    }
  }
}

// For Swift 6 strict concurrency checking, https://stackoverflow.com/q/78625718/5024990
private struct SendablePromise<Output>: @unchecked Sendable {
  let promise: (Result<Output, Error>) -> Void
}
