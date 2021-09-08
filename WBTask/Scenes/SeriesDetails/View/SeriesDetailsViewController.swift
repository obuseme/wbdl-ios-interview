//
//  SeriesDetailsViewController.swift
//  WBTask
//
//  Created by Ugur on 07/09/2021.
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
    tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.typeString)
    tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.typeString)
    tableView.register(ComicsTableViewCell.self, forCellReuseIdentifier: ComicsTableViewCell.typeString)

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

    let logo = UIImageView(image: UIImage(named: "logo"))
    logo.contentMode = .scaleAspectFit
    navigationItem.titleView = logo

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
    case .title(let label, let title):
      if let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.typeString, for: indexPath) as? TitleTableViewCell {
        cell.setTitleCell(label, title: title)
        return cell
      }
    case .character(let character):
      if let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.typeString, for: indexPath) as? CharacterTableViewCell {
        cell.setCharacterCell(character)
        return cell
      }
    case .comics(let comics):
      if let cell = tableView.dequeueReusableCell(withIdentifier: ComicsTableViewCell.typeString, for: indexPath) as? ComicsTableViewCell {
        cell.setComicsCell(comics)
        return cell
      }
    }
    return UITableViewCell()
  }


  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sections.count
  }

}
