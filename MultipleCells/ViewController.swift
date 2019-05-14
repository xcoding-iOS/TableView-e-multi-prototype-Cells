//
//  ViewController.swift
//  MultipleCells
//
//  Created by Giuseppe Sapienza on 13/05/2019.
//  Copyright © 2019 Giuseppe Sapienza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var feed: [Any] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createFeed()
        self.tableView.dataSource = self
    }
    
    func createFeed() {
        self.feed = [
            Video.init(
                thumbnail: UIImage.init(),
                title: "Impariamo a creare una TableView con più di una Prototype Cells con il linguaggio Swift",
                date: "04/01/20115",
                lastComment: Comment.init(
                    text: "Voglio condividere con voi un problema relativo alla mia applicazione. Non riesco a creare",
                    authorImage: UIImage.init())
            ),
            Post.init(
                title: "Come utilizzare il database locale di Realm con Swift",
                date: "05/01/2115",
                image: UIImage.init()
            ),
            Post.init(
                title: "Variabili e costanti con il linguaggio Swift",
                date: "04/01/2115",
                image: UIImage.init()
            ),
            Video.init(
                thumbnail: UIImage.init(),
                title: "Cos'è la programmazione orientata agli Oggetti",
                date: "03/01/20115",
                lastComment: nil)
        ]
        
    }


}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.feed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell.init()
    }
    
}

