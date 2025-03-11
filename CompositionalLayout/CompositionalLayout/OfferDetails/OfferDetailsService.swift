//
//  OfferDetailsService.swift
//  LoyaltyCompositionalLayout
//
//  Created by Ben Shutt on 03/03/2025.
//

import Foundation
import Combine

struct OfferDetailsService {
  var publisher: AnyPublisher<OfferDetails, Error> {
    Deferred {
      Future {
        try await load()
      }
    }
    .multicast(subject: PassthroughSubject())
    .autoconnect()
    .receive(on: DispatchQueue.main)
    .eraseToAnyPublisher()
  }

  private func load() async throws -> OfferDetails {
    try await Task.sleep(nanoseconds: 2 * 1_000_000_000) // Simulate network (iOS 15)
    return .init(
      imageURL: .coffee,
      badges: [
        "27 days to reward",
        "Some test text",
        "Buy in store or online",
        "Content to check",
        "Small",
        "Plus a longer one to see what happens here"
      ],
      popularItems: [
        .init(imageURL: .animal1),
        .init(imageURL: .animal2),
        .init(imageURL: .animal3),
        .init(imageURL: .animal4),
        .init(imageURL: .animal5)
      ],
      termsAndConditions: """
        Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod \
        tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, \
        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
        """
    )
  }
}

// MARK: - URL + Extensions

private extension URL {
  static let coffee = URL(string: """
    https://live.staticflickr.com/5013/5453211822_00774152a5_z.jpg
    """
  )!

  static let animal1 = URL(string: """
    https://media.istockphoto.com/id/1729434089/photo/sheeps.jpg\
    ?s=2048x2048&w=is&k=20&c=qtLsKB3kwaU7RtbVuYJ_qC8ZRtJ1MNecTIuL2dEU_Bw=
    """
  )!

  static let animal2 = URL(string: """
    https://media.istockphoto.com/id/1283550299/photo/sea-otter-on-ice-enhydra-\
    lutris-prince-william-sound-alaska-in-front-of-surprise-glacier.jpg\
    ?s=2048x2048&w=is&k=20&c=pLlvA5oA3t1lo-xY8FL-yJXa5RDakLKSZX8elOInosg=
    """
  )!

  static let animal3 = URL(string: """
    https://cdn.pixabay.com/photo/2023/06/26/13/41/wolf-8089783_1280.jpg
    """
  )!

  static let animal4 = URL(string: """
    https://cdn.pixabay.com/photo/2024/01/18/10/50/cormorant-8516719_1280.jpg
    """
  )!

  static let animal5 = URL(string: """
    https://cdn.pixabay.com/photo/2022/12/26/11/44/squirrel-7678830_1280.jpg
    """
  )!
}
