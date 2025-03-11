//
//  CollectionViewController.swift
//  LoyaltyCompositionalLayout
//
//  Created by Ben Shutt on 03/03/2025.
//

import UIKit
import Combine
import CompositionalLayoutBuilder

final class CollectionViewController: UICollectionViewController {
  private typealias DataSource = UICollectionViewDiffableDataSource<Section, Item>
  private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>

  private let viewModel = OfferDetailsViewModel()
  private var cancellables: Set<AnyCancellable> = []
  private lazy var dataSource = DataSource(
    collectionView: collectionView,
    cellProvider: { collectionView, indexPath, item in
      item.item.dequeueAndConfigureCell(
        collectionView: collectionView,
        for: indexPath
      )
    }
  )

  // MARK: - Init

  init() {
    super.init(collectionViewLayout: UICollectionViewCompositionalLayout(
      sectionProvider: { [weak viewModel] sectionIndex, environment in
        viewModel?.sections[sectionIndex].provider.makeSection(in: environment)
      },
      configuration: {
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.interSectionSpacing = 0
        return configuration
      }()
    ))
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("\(#function) has not been implemented")
  }

  // MARK: - ViewController lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    CompositionalLayoutItems.all.forEach {
      $0.registerCell(collectionView: collectionView)
    }

    viewModel.$sections
      .sink { [unowned self] sections in
        redraw(animated: !sections.isEmpty)
      }
      .store(in: &cancellables)
  }

  // MARK: - Redraw

  private func redraw(animated: Bool) {
    let sections = viewModel.sections

    var snapshot = Snapshot()
    snapshot.appendSections(sections)
    sections.forEach { section in
      snapshot.appendItems(section.items, toSection: section)
    }

    dataSource.apply(snapshot, animatingDifferences: animated)
  }

  // MARK: - UICollectionViewDelegate

  override func collectionView(
    _ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath
  ) {
    collectionView.deselectItem(at: indexPath, animated: true)
    viewModel[indexPath].didSelect()
  }
}
