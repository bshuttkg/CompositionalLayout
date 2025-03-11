//
//  OfferDetailsViewModel.swift
//  LoyaltyCompositionalLayout
//
//  Created by Ben Shutt on 03/03/2025.
//

import SwiftUI
import Combine
import CompositionalLayoutBuilder

typealias Section = CompositionalLayoutSection<OfferDetailsSectionID>
typealias Item = AnyCompositionalLayoutItem

// MARK: - OfferDetailsViewModel

@MainActor
final class OfferDetailsViewModel: ObservableObject {
  private let service = OfferDetailsService()
  private var cancellables = Set<AnyCancellable>()

  @PublishedValue private var offerDetails: OfferDetails?
  @PublishedValue private var isTermsAndConditionsExpanded = false
  @PublishedValue private(set) var isLoading = false
  @PublishedValue private(set) var sections: [Section] = []

  // MARK: - Init

  init() {
    refresh()

    Publishers.CombineLatest(
      $offerDetails,
      $isTermsAndConditionsExpanded
    )
    .sink { [unowned self] _ in redraw() }
    .store(in: &cancellables)
  }

  func refresh() {
    guard !isLoading else { return }
    isLoading = true

    service.publisher
      .sink(
        receiveCompletion: { [unowned self] error in
          isLoading = false
        },
        receiveValue: { [unowned self] newValue in
          offerDetails = newValue
        }
      )
      .store(in: &cancellables)
  }

  private func redraw() {
    if let offerDetails {
      sections = sections(for: offerDetails)
    } else {
      sections = []
    }
  }

  @SectionBuilder<OfferDetailsSectionID>
  func sections(for offerDetails: OfferDetails) -> [Section] {
    // An image cell which fills the width and is 300pt high
    FrameLayout(
      width: .fractionalWidth(1),
      height: .absolute(300)
    )
    .items(id: .imageHeader) {
      ImageItem(imageURL: offerDetails.imageURL)
    }

    // Badge cells that stack in a flow layout
    FlowLayout(
      estimatedItemWidth: 100,
      estimatedItemHeight: 100,
      hSpacing: 8,
      vSpacing: 8,
      contentInsets: .init(
        top: 16, leading: 16, bottom: 16, trailing: 16
      )
    )
    .items(id: .badges) {
      offerDetails.badges.map { text in
        BadgeItem(text: text)
      }
    }

    // Accordion that hides and shows detail when selected
    FrameLayout(
      width: .fractionalWidth(1),
      height: .estimated(100),
      contentInsets: .init(
        top: 16, leading: 16, bottom: 16, trailing: 16
      )
    )
    .items(id: .termsAndConditions) {
      AccordionHeaderItem(
        text: "Terms and Conditions",
        isExpanded: isTermsAndConditionsExpanded,
        didSelect: { [unowned self] in
          isTermsAndConditionsExpanded.toggle()
        }
      )

      if isTermsAndConditionsExpanded {
        TextItem(text: offerDetails.termsAndConditions)
      }
    }

    // Horizontal carousel of cards
    CarouselLayout(
      width: .absolute(248),
      height: .absolute(300),
      hSpacing: 20,
      contentInsets: .init(
        top: 10, leading: 16, bottom: 10, trailing: 16
      )
    )
    .items(id: .popularItems) {
      offerDetails.popularItems.map { popularItem in
        CardItem(imageURL: popularItem.imageURL)
      }
    }
  }

  subscript(indexPath: IndexPath) -> AnyCompositionalLayoutItem {
    sections[indexPath.section].items[indexPath.item]
  }
}
