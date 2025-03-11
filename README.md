### CompositionalLayout

A proof-of-concept iOS app that constructs the sections and items of a compositional layout using a `@resultBuilder`. It reads similarly to SwiftUI `body`, but here sections map to `NSCollectionLayoutSection` and items to `UICollectionViewCell`s. For example:

```swift
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
```

This will build an `[CompositionalLayoutSection]` (sections of items) that can be applied using a snapshot.

### CompositionalLayoutItem

Similarly to `View`, `CompositionalLayoutItem` are lightweight structs (value-type).
They should be understood as a _description_ of a cell; their properties define the cell configuration.
For example:

```swift
struct TextItem: CompositionalLayoutItem {
  var text: String

  func configure(
    cell: TextCollectionViewCell,
    for indexPath: IndexPath
  ) {
    cell.text = text
  }
}

// MARK: - ID

extension TextItem {
  nonisolated var id: String {
    "\(Self.self).\(text)"
  }
}
```

The ID should be unique and change when the item needs to redraw. 
If the ID does not change, the snapshot will not redraw it (which is what we want).

### Key Entities

- `CompositionalLayoutItem` - protocol description of an item
- `CompositionalLayoutSection` - a section of items and a protocol description of a section
- `ArrayBuilder` - the `@resultBuilder`
- `OfferDetailsViewModel` - observable which builds the content
- `CollectionViewController` - the view controller

### Enum

Enums may still be used for IDs. This project uses type erasure to map all items to a single type for the diffable data source.