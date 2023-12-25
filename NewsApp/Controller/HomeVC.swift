//
//  ViewController.swift
//  NewsApp
//
//  Created by Tolga Sarikaya on 25.12.23.
//

import UIKit
import SDWebImage

class HomeVC: UIViewController {

   
    @IBOutlet weak var tableView: UITableView!
    
    var model : [News] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        getData()
    }
    
    func getData() {
        WebServices.shared.fetchNews { model in
            
            if let model = model {
                DispatchQueue.main.async {
                    self.model = model
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension HomeVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsCell
        let item = model[indexPath.row]
        cell.titleLabel.text = item.title
        cell.descriptionLabel.text = item.title
        cell.newsIV.sd_setImage(with: URL(string: item.urlToImage ?? "nil"))
        return cell
    }
    
}

