//
//  TableViewController.swift
//  BMTask
//
//  Created by Hamdy Youssef on 07/08/2023.
//

import UIKit
import SDWebImage

class TableViewController: UITableViewController {
    
    var arrOfMovies: [[String: Any]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let movieData: [String: String] = ["term": "ali", "media": "movie"]
        
        APIManager.getMovies(parameter: movieData) { error, mediaArr in
            if let error = error {
                print(error.localizedDescription)
            } else if let mediaArr = mediaArr {
                for media in mediaArr {
                    self.arrOfMovies.append(["kind": media.kind,
                                        "artistName": media.artistName,
                                        "previewUrl": media.previewUrl ?? "not found",
                                        "artworkUrl100": media.artworkUrl100,
                                        "trackName": media.trackName])
                    self.tableView.reloadData()
                }
            }
        }
        
//        APIManager.getEmployees { error, empArr in
//            if let error = error {
//                print(error.localizedDescription)
//            } else if let empArr = empArr {
//                for em in empArr {
//                    self.arrOfNames.append(em.name)
//                    self.tableView.reloadData()
//                }
//            }
//        }
    }

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfMovies.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell
        let index = indexPath.row
        let movie = arrOfMovies[index]
        cell?.movieArtName.text = movie["artistName"] as? String
        cell?.movieTrackName.text = movie["trackName"] as? String
        cell?.movieImage.sd_setImage(with: URL(string: (movie["artworkUrl100"] as? String)!))
        return cell!
    }
}
