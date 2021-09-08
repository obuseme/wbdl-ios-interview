//
//  HomeSeriesViewController.swift
//  WBTask
//
//  Created by Ugur on 06/09/2021.
//

import UIKit
import SnapKit

protocol HomeSeriesDisplayable: LoadingDisplayable, AlertDisplayable {
  func displayHomeSeries(viewModel: [Series])
}

final class HomeSeriesViewController: UIViewController {

  var interactor: HomeSeriesInteractable?
  var router: HomeSeriesRouter?

  private var viewModel: [Series]? {
    didSet {
      guard viewModel != nil else {
        return
      }
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }

  // MARK: UI

  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .none
    tableView.allowsSelection = true
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 180
    tableView.register(SeriesTableViewCell.self, forCellReuseIdentifier: SeriesTableViewCell.typeString)
    return tableView
  }()

  // MARK: Init

  init() {
    super.init(nibName: nil, bundle: nil)
    setupScene()

    setupScene()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    setupUI()

    interactor?.fetchHomeSeries()
  }

  // MARK: Setup

  private func setupScene() {
    let viewController = self
    let presenter = HomeSeriesPresenter()
    let interactor = HomeSeriesInteractor(presenter: presenter)
    let router = HomeSeriesRouter()
    viewController.interactor = interactor
    viewController.router = router
    presenter.viewController = viewController
    router.viewController = viewController
  }

  private func setupUI() {
    view.backgroundColor = StyleProvider.lightBackgroundColor
    tableView.backgroundColor = StyleProvider.lightBackgroundColor

    let logo = UIImageView(image: UIImage(named: "logo"))
    logo.contentMode = .scaleAspectFit
    navigationItem.titleView = logo

    view.addSubview(tableView)

    tableView.snp.makeConstraints { make in
      make.edges.equalTo(view.safeAreaLayoutGuide)
    }
  }
}

// MARK: HomeSeriesDisplayable

extension HomeSeriesViewController: HomeSeriesDisplayable {
  func displayHomeSeries(viewModel: [Series]) {
    self.viewModel = viewModel
  }
}

// MARK: UITableViewDataSource

extension HomeSeriesViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: SeriesTableViewCell.typeString, for: indexPath) as? SeriesTableViewCell, let series = viewModel?[indexPath.row] {
      cell.setSeriesCell(series)
      return cell
    }
    return UITableViewCell()
  }


  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel?.count ?? 0
  }

}

// MARK: UITableViewDelegate

extension HomeSeriesViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: false)

    if let series = viewModel?[indexPath.row] {
      router?.navigateToSeriesDetails(destination: SeriesDetailsViewController(series: series))
    }
  }
}
