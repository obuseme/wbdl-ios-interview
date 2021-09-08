//
//  SeriesDetailsViewController.swift
//  WBTask
//
//  Created by Ugur on 07/09/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SeriesDetailsDisplayable: LoadingDisplayable, AlertDisplayable {
  func displaySeriesDetails(viewModel: SeriesDetailsViewModel)
}

final class SeriesDetailsViewController: UIViewController {

  var interactor: SeriesDetailsInteractable?

  private var sections: [SeriesDetailsSectionType] = []

  // MARK: UI

  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.dataSource = self
    tableView.separatorStyle = .none
    tableView.allowsSelection = true
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 150
    tableView.register(PosterTableViewCell.self, forCellReuseIdentifier: PosterTableViewCell.typeString)
    return tableView
  }()

  // MARK: Init

  init(series: Series) {
    super.init(nibName: nil, bundle: nil)

    setupScene()

    interactor?.series = series
  }

  // MARK: Object lifecycle

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupScene()
  }

  // MARK: View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()

    interactor?.fetchSeriesDetails()
  }

  // MARK: Setup

  private func setupScene() {
    let viewController = self
    let presenter = SeriesDetailsPresenter()
    let interactor = SeriesDetailsInteractor(presenter: presenter)
    viewController.interactor = interactor
    presenter.viewController = viewController
  }

  private func setupUI() {
    view.backgroundColor = StyleProvider.lightBackgroundColor
    tableView.backgroundColor = StyleProvider.lightBackgroundColor

    view.addSubview(tableView)

    tableView.snp.makeConstraints { make in
      make.edges.equalTo(view.safeAreaLayoutGuide)
    }
  }
}

extension SeriesDetailsViewController: SeriesDetailsDisplayable {

  func displaySeriesDetails(viewModel: SeriesDetailsViewModel) {
    sections = viewModel.sections

    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
}

// MARK: UITableViewDataSource

extension SeriesDetailsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch sections[indexPath.row] {
    case .poster(let thumbnail):
      if let cell = tableView.dequeueReusableCell(withIdentifier: PosterTableViewCell.typeString, for: indexPath) as? PosterTableViewCell {
        cell.setPosterCell(thumbnail)
        return cell
      }
    default:
      return UITableViewCell()
    }
    return UITableViewCell()
  }


  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sections.count
  }

}
