//
//  ComicsTableViewCell.swift
//  WBTask
//
//  Created by Ugur on 08/09/2021.
//

import UIKit

class ComicsTableViewCell: BaseTableViewCell {

  // MARK: - UI

  private lazy var collectionView: UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .horizontal

    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    collectionView.register(ComicsCollectionViewCell.self, forCellWithReuseIdentifier: ComicsCollectionViewCell.typeString)
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.delegate = self
    collectionView.dataSource = self
    return collectionView
  }()

  // MARK: - Properties

  private var comiscList: [Comics]? {
    didSet {
      collectionView.reloadData()
    }
  }


  // MARK: - Init

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

      setupUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Layout

  private func setupUI() {
    contentView.addSubview(collectionView)

    collectionView.snp.makeConstraints { make in
      make.leading.trailing.top.equalToSuperview()
      make.height.equalTo(200)
      make.bottom.equalToSuperview().offset(-StyleProvider.Paddings.small)
    }
  }

  func setComicsCell(_ comics: [Comics]) {
    comiscList = comics
  }
}

extension ComicsTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return comiscList?.count ?? 0
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ComicsCollectionViewCell.typeString, for: indexPath) as? ComicsCollectionViewCell, let comics = comiscList?[indexPath.row] {
      cell.setComicsCell(comics)
      return cell
    }
    return ComicsCollectionViewCell()
  }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ComicsTableViewCell: UICollectionViewDelegateFlowLayout {

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

    return CGSize(width: collectionView.frame.height * 0.7, height: contentView.frame.height)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: StyleProvider.Paddings.medium, bottom: 0, right: StyleProvider.Paddings.medium)
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return StyleProvider.Paddings.small
  }
}
