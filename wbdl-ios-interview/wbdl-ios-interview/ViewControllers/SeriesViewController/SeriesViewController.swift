//
//  SeriesViewController.swift
//  wbdl-ios-interview
//
//  Created by Tadreik Campbell on 2/11/22.
//

import UIKit
import Combine

final class SeriesViewController: UIViewController {
    
    // putting this in a typealias since its such a long init
    typealias SeriesDataSource = UICollectionViewDiffableDataSource<Section, Series>
    
    enum Section {
        case main
    }
    
    lazy var collectionView: UICollectionView = {
        let v = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 50, right: 0)
        v.showsVerticalScrollIndicator = false
        v.delegate = self
        return v
    }()
    
    private var viewModel = SeriesVCViewModel()
    private var dataSource: SeriesDataSource!
    private var observers = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        setupDataSource()
        setupObservers()
        viewModel.fetchComicSeries()
    }
    
    private func setupConstraints() {
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupObservers() {
        viewModel.$comicSeriesList.sink { [weak self] in
            // When the data changes, collectionview will update automatically
            self?.updateCollectionView(series: $0)
        }.store(in: &observers)
    }
    
}

// MARK: - CollectionView Methods
extension SeriesViewController {
    
    /// Advantage of diffable datasource:
    /// If the supplied [Series] has different elements from the one currently in the datasource,
    /// the collectionview will update, else nothing will happen
    private func updateCollectionView(series: [Series]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Series>()
        snapshot.appendSections([.main])
        snapshot.appendItems(series, toSection: .main)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: false)
        }
    }
    
    private func createLayout() -> UICollectionViewLayout {
        // Choosing this CompositionalLayout initializer will allow us to
        // customize the layout on a per section basis and... (sectionIndex)
        // based on the size of the screen- for device rotation, iPad etc. (environment)
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(250))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
            group.interItemSpacing = .fixed(10)
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 10
            return section
        }
        return layout
    }
    
    private func setupDataSource() {
        // This is a new way to deqeue cells so we don't have to worry about cell identifiers.
        // The closure is executed for every cell in the collectionview
        let reg = UICollectionView.CellRegistration<SeriesCell, Series> { cell, indexPath, series in
            cell.thumbImageView.insertImageFromURL(series.thumbnail.url)
            cell.titleLbl.text = series.title
            cell.dateRangeLbl.text = "\(series.startYear) to \(series.endYear)"
            cell.countLbl.text = "\(series.comics.available) comics"
        }
        
        dataSource = SeriesDataSource ( collectionView: collectionView, cellProvider: { collectionView, indexPath, series in
            return collectionView.dequeueConfiguredReusableCell(using: reg, for: indexPath, item: series)
        })
    }
}

// MARK: - CollectionView Delegate
extension SeriesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let series = dataSource.itemIdentifier(for: indexPath),
           let cell = collectionView.cellForItem(at: indexPath) as? SeriesCell {
            let vc = ComicsViewController(series: series, image: cell.thumbImageView.image!)
            show(vc, sender: self)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        // start fetching new data when collection view is about to end
        let count = 4
        // a higher count gives the network more time to download new data,
        // meaning the user is less likely to hit the end of the collection
        if indexPath.item >= viewModel.comicSeriesList.count - count {
            viewModel.fetchComicSeries()
        }
    }
}


