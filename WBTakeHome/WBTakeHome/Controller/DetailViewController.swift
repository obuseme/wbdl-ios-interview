//
//  DetailViewController.swift
//  WBTakeHome
//
//  Created by Nick Nguyen on 2/14/22.
//

import UIKit

class DetailViewController: UIViewController {
  
  // MARK: - Properties
  
  var comic: ComicSerie?
  
  var comicCharacters = [ComicCharacter]() {
    didSet {
      detailTableView.reloadData()
    }
  }
  
  var comicBooks = [ComicBook]() {
    didSet {
      detailTableView.reloadData()
    }
  }
  
  @IBOutlet weak var comicThumbnailImage: UIImageView! {
    didSet {
      displayImage()
    }
  }
  
  @IBOutlet weak var detailTableView: UITableView!
  
  // MARK: - View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = comic?.title
    fetchListOfCharacters()
    fetchListOfBooks()
    detailTableView.dataSource = self
    detailTableView.register(CharacterCell.self, forCellReuseIdentifier: "CharacterCell")
    detailTableView.register(ComicBookCell.self, forCellReuseIdentifier: "ComicCell")
  }
  
  // MARK: - Actions
  
  private func displayImage() {
    
    let baseURLImage = URL(string: comic!.thumbnail.path)!
    
    let finalURLImage = baseURLImage.appendingPathComponent("portrait_incredible")
      .appendingPathExtension(comic!.thumbnail.extension).usingHTTPS!
    
    comicThumbnailImage.downloaded(from: finalURLImage)
  }
  
  private func fetchListOfCharacters() {
    NetworkService.shared.fetchListsOfCharacters(seriesID: comic!.id) { result in
      switch result {
      case .failure(let error):
        print(error)
      case .success(let json):
        self.comicCharacters = json.data.results
      }
    }
  }
  
  private func fetchListOfBooks() {
    NetworkService.shared.fetchListsOfComicBooks(seriesID: comic!.id) { result in
      switch result {
      case .failure(let error):
        print(error)
      case .success(let json):
        self.comicBooks = json.data.results
      }
    }
  }
}

// MARK: - Table View Data Source

extension DetailViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    var title = ""
    switch section {
    case 0:
      title = "CHARACTERS LIST"
    case 1:
      title = "BOOK LISTS"
    default:
      break
    }
    return title
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var numberOfRowsInSection = 0
    switch section {
    case 0:
      numberOfRowsInSection = comicCharacters.count
    case 1:
      numberOfRowsInSection = comicBooks.count
    default:
      ()
    }
    return numberOfRowsInSection
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell: UITableViewCell?
    switch indexPath.section {
    case 0:
      cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath)
      let comicCharacter = comicCharacters[indexPath.row]
      
      cell?.textLabel?.text = comicCharacter.name
      cell?.detailTextLabel?.text = comicCharacter.description
      cell?.detailTextLabel?.numberOfLines = 0
    case 1:
      cell = tableView.dequeueReusableCell(withIdentifier: "ComicCell", for: indexPath)
      let comicBook = comicBooks[indexPath.row]
      
      cell?.textLabel?.text = comicBook.title
      cell?.textLabel?.numberOfLines = 0
      cell?.detailTextLabel?.text = "Issue number: \(comicBook.issueNumber ?? 0)"
      
      let baseURLImage = URL(string: comicBook.thumbnail.path)!
      let finalURLImage = baseURLImage.appendingPathComponent("portrait_small").appendingPathExtension(comic!.thumbnail.extension).usingHTTPS!
      
      cell?.imageView?.downloaded(from: finalURLImage)
   
    default:
      break
    }
    
    return cell!
  }
}

