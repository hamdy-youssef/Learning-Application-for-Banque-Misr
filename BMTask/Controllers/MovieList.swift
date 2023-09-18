//
//  MovieList.swift
//  BMTask
//
//  Created by Hamdy Youssef on 08/08/2023.
//

import UIKit

class MovieList: UIViewController {
    
    @IBOutlet weak var movietableView: UITableView!
    
    let arrOfMovie: [Movie] = [Movie(image: "mov1"), Movie(image: "mov2"), Movie(image: "mov3"), Movie(image: "mov4"), Movie(image: "mov5"), Movie(image: "mov6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserDefaultsManager.shared().setIsloggedIn(isloggedIn: true)
        self.navigationItem.title = "Movie List"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(goToProfileNav))
        movietableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "movieCell")
        
        movietableView.dataSource = self
        movietableView.delegate = self
    }

    @objc func goToProfileNav() {
        let sb = UIStoryboard (name: "Main", bundle: nil)
        let profileVC = sb.instantiateViewController (withIdentifier: "ProfileVc") as! ProfileVc
        self.navigationController?.pushViewController(profileVC, animated: true)
    }

    
    @IBAction func goToProfile(_ sender: Any) {
        let sb = UIStoryboard (name: "Main", bundle: nil)
        let profileVC = sb.instantiateViewController(withIdentifier: "ProfileVc") as! ProfileVc
        self.present (profileVC, animated: true)
    }
}

extension MovieList: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrOfMovie.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MyTableViewCell
        let image = arrOfMovie[indexPath.row].image
        cell.imageCell.image = UIImage(named: image)
        print("hi")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    
}
