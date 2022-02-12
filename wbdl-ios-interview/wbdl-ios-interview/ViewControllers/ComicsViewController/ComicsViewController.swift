//
//  ComicsViewController.swift
//  wbdl-ios-interview
//
//  Created by Tadreik Campbell on 2/11/22.
//

import UIKit
import Combine

final class ComicsViewController: UIViewController {
    
    // putting this in a typealias since its such a long init
    typealias ComicsDataSource = UICollectionViewDiffableDataSource<Section, Comic>
    
    enum Section {
        case main
    }
    
    lazy var collectionView: UICollectionView = {
        let v = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        v.translatesAutoresizingMaskIntoConstraints = false
        v.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50, right: 0)
        v.showsVerticalScrollIndicator = false
        v.delegate = self
        return v
    }()
    
    var initialFetchCancellable: AnyCancellable!
    
    private var viewModel: ComicsVCViewModel
    private var dataSource: ComicsDataSource!
    private var observers = Set<AnyCancellable>()
    
    var series: Series
    var seriesImage: UIImage
    
    init(series: Series, image: UIImage) {
        self.series = series
        self.seriesImage = image
        self.viewModel = ComicsVCViewModel(seriesID: series.id)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        setupDataSource()
        collectionView.showLoadingView()
        setupObservers()
        viewModel.fetchComics()
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
        initialFetchCancellable = viewModel.$isInitialFetchComplete.sink { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.setupCharViews(self.viewModel.characters)
                self.collectionView.backgroundView = nil
                self.updateCollectionView(comics: self.viewModel.comics)
                self.setupComicsObserver()
            }
        }
    }
    
    private func setupComicsObserver() {
        // observer for comics
        viewModel.$comics.sink { [weak self] in
            guard let self = self else { return }
            let list = $0 // need to copy this here to use it in the next closure
            DispatchQueue.main.async {
                self.updateCollectionView(comics: list)
            }
        }.store(in: &observers)
    }
    
    private func setupCharViews(_ chars: [ComicCharacter]) {
        guard let headerView = self.collectionView.supplementaryView(forElementKind: "series-header", at: IndexPath(item: 0, section: 0)) as? SeriesHeader else {
            return
        }
        headerView.thumbImageView.image = seriesImage
        for char in chars {
            let v = CharacterView(character: char)
            headerView.charStackView.addArrangedSubview(v)
        }
    }
    
}

// MARK: - CollectionView Methods
extension ComicsViewController {
    
    /// If the supplied [Series] has different elements from the one currently in the datasource,
    /// the collectionview will update, else nothing will happen
    private func updateCollectionView(comics: [Comic]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Comic>()
        snapshot.appendSections([.main])
        snapshot.appendItems(comics, toSection: .main)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
    private func createLayout() -> UICollectionViewLayout {
        // Choosing this CompositionalLayout initializer will allow us to
        // customize the layout on a per section basis and... (sectionIndex)
        // based on the size of the screen- for device rotation, iPad etc. (environment)
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(260))
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(260))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
            let section = NSCollectionLayoutSection(group: group)
            let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(460))
            let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: "series-header", alignment: .top)
            header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)
            section.boundarySupplementaryItems = [header]
            section.interGroupSpacing = 10
            return section
        }
        return layout
    }
    
    private func setupDataSource() {
        // This is a new way to deqeue cells so we don't have to worry about cell identifiers.
        // The closure is executed for every cell in the collectionview
        let cellReg = UICollectionView.CellRegistration<ComicCell, Comic> { cell, indexPath, comic in
            cell.thumbImageView.insertImageFromURL(comic.thumbnail.url)
            cell.titleLbl.text = comic.title
            cell.issueLbl.text = "Issue \(comic.issueNumber)"
        }
        
        let headerReg = UICollectionView.SupplementaryRegistration<SeriesHeader>(elementKind: "series-header") { headerView, string, indexPath  in
            headerView.titleLbl.text = self.series.title
            headerView.thumbImageView.image = self.seriesImage
        }
        
        dataSource = ComicsDataSource ( collectionView: collectionView, cellProvider: { collectionView, indexPath, series in
            return collectionView.dequeueConfiguredReusableCell(using: cellReg, for: indexPath, item: series)
        })
        
        dataSource.supplementaryViewProvider = {(collectionView, elementKind, indexPath) -> UICollectionReusableView in
            return collectionView.dequeueConfiguredReusableSupplementary(using: headerReg, for: indexPath)
        }
        
    }
}

// MARK: - CollectionView Delegate
extension ComicsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        // start fetching new data when collection view is about to end
        if indexPath.item == viewModel.comics.count - 2 {
            viewModel.fetchComics()
        }
    }
    
}

