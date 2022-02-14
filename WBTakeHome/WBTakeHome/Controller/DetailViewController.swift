//
//  DetailViewController.swift
//  WBTakeHome
//
//  Created by Nick Nguyen on 2/14/22.
//

import UIKit

class DetailViewController: UIViewController {
  var comic: ComicSerie?
  var comicCharacters: [ComicCharacter] = [] {
    didSet {
      detailTableView.reloadData()
    }
  }
  
  @IBOutlet weak var comicThumbnailImage: UIImageView!
  
  @IBOutlet weak var detailTableView: UITableView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = comic?.title
    
    let baseURLImage = URL(string: comic!.thumbnail.path)!
    let finalURLImage = baseURLImage.appendingPathComponent("portrait_incredible").appendingPathExtension(comic!.thumbnail.extension).usingHTTPS!
    
    
    comicThumbnailImage.downloaded(from: finalURLImage)
    
    
    print(comic?.id)
    
    NetworkService.shared.fetchListsOfCharacters(seriesID: comic!.id) { result in
      switch result {
      case .failure(let error):
        print(error)
      case .success(let json):
        self.comicCharacters = json.data.results
        print(self.comicCharacters)
      }
    }
    detailTableView.dataSource = self
    detailTableView.register(CharacterCell.self, forCellReuseIdentifier: "CharacterCell")
  }
}

extension DetailViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  
    let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath)
    let comicCharacter = comicCharacters[indexPath.row]
    
    cell.textLabel?.text = comicCharacter.name
    cell.detailTextLabel?.text = comicCharacter.description
    cell.detailTextLabel?.numberOfLines = 0
    
    return cell
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
//
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    var numberOfRowsInSection = 0
    switch section {
    case 0:
      numberOfRowsInSection =  comicCharacters.count
    case 1:
      break
    default:
      ()
    }
    return numberOfRowsInSection
  }
}
