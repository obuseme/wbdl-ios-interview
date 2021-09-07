//
//  HomeComicsViewController.swift
//  WBTask
//
//  Created by Ugur on 06/09/2021.
//

import UIKit
import SnapKit

protocol HomeComicsDisplayable: LoadingDisplayable, AlertDisplayable {
  func displayHomeComics(viewModel: [HomeComicsViewModel])
}

final class HomeComicsViewController: UIViewController {

  var interactor: HomeComicsInteractable?
  var router: HomeComicsRouter?

  private var viewModel: [HomeComicsViewModel]? {
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

  private lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .none
    tableView.allowsSelection = true
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 180
    tableView.register(ComicsTableViewCell.self, forCellReuseIdentifier: ComicsTableViewCell.typeString)
    return tableView
  }()

  // MARK: View lifecycle

  override func viewDidLoad() {
    super.viewDidLoad()

    setupScene()
    setupUI()

    interactor?.fetchHomeComics()
  }

  // MARK: Setup

  private func setupScene() {
    let viewController = self
    let presenter = HomeComicsPresenter()
    let interactor = HomeComicsInteractor(presenter: presenter)
    let router = HomeComicsRouter()
    viewController.interactor = interactor
    viewController.router = router
    presenter.viewController = viewController
    router.viewController = viewController
  }

  private func setupUI() {
    view.backgroundColor = StyleProvider.lightBackgroundColor
    tableView.backgroundColor = StyleProvider.lightBackgroundColor

    view.addSubview(tableView)

    tableView.snp.makeConstraints { make in
      make.edges.equalTo(view.safeAreaLayoutGuide)
    }
  }

  private func setupAccessibilityIdentifers() {

  }
}

// MARK: HomeComicsDisplayable

extension HomeComicsViewController: HomeComicsDisplayable {
  func displayHomeComics(viewModel: [HomeComicsViewModel]) {
    self.viewModel = viewModel
  }
}

// MARK: UITableViewDataSource

extension HomeComicsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: ComicsTableViewCell.typeString, for: indexPath) as? ComicsTableViewCell, let comics = viewModel?[indexPath.row] {
      cell.setComicsCell(comics)
      return cell
    }
    return UITableViewCell()
  }


  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel?.count ?? 0
  }

}

// MARK: UITableViewDelegate

extension HomeComicsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: false)

    if let comics = interactor?.comics?[indexPath.row] {
      router?.navigateToComicsDetails(destination: ComicsDetailsViewController(comics: comics))
    }
  }
}
