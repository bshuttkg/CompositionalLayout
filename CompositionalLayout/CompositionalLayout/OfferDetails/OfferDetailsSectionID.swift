//
//  OfferDetailsSectionID.swift
//  CompositionalLayout
//
//  Created by Ben Shutt on 08/03/2025.
//

import CompositionalLayoutBuilder

enum OfferDetailsSectionID: Int, CompositionalLayoutID {
  case imageHeader
  case badges
  case termsAndConditions
  case popularItems

  var id: Self { self }
}
