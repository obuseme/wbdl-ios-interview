//
//  MainTableViewController.swift
//  WBTakeHome
//
//  Created by Nick Nguyen on 2/14/22.
//

import UIKit

class MainTableViewController: UITableViewController {
  
  var comicSeries: [ComicSerie] = [] {
    didSet {
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Comics"
    tableView.rowHeight = 240
    
    NetworkService.shared.fetchComicSeries { result in
      switch result {
      case .success(let jsonPayload):
        self.comicSeries = jsonPayload.data.results
      case.failure(let error):
        print(error)
      }
    }
  }
  
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return comicSeries.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: SerieCell.cellIdentifer, for: indexPath) as! SerieCell
    let comic = comicSeries[indexPath.row]
    
    cell.titleLabel.text = comic.title
    cell.numberOfComicsLabel.text = "Number of comics: \(comic.comics.available)"
    cell.startDateLabel.text = "Start year: \(comic.startYear)"
    cell.endDateLabel.text = "End year: \(comic.endYear)"
    
    let baseURLImage = URL(string: comic.thumbnail.path)!
    let finalURLImage = baseURLImage.appendingPathComponent("portrait_uncanny").appendingPathExtension(comic.thumbnail.extension).usingHTTPS!
    
    cell.serieThumbnail.downloaded(from: finalURLImage)
    cell.setNeedsDisplay()
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let comic = comicSeries[indexPath.row]
    print(comic.id)
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Create a variable that you want to send
    guard let indexPath = tableView.indexPathForSelectedRow else {
      return
    }
    var selectedComic = comicSeries[indexPath.row]
    
    let destinationVC = segue.destination as! DetailViewController
    destinationVC.comic = selectedComic
  }
}


