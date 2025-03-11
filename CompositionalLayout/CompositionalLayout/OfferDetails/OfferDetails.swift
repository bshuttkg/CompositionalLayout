//
//  OfferDetails.swift
//  LoyaltyCompositionalLayout
//
//  Created by Ben Shutt on 03/03/2025.
//

import Foundation

typealias Model = Sendable & Equatable & Hashable & Codable

struct OfferDetails: Model {
  var imageURL: URL
  var badges: [String]
  var popularItems: [PopularItem]
  var termsAndConditions: String
}

// MARK: - OfferDetails + PopularItem

extension OfferDetails {
  struct PopularItem: Model {
    var imageURL: URL
  }
}
