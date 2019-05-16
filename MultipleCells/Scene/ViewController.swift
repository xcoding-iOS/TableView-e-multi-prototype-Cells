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
    
    var feed: [FeedItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createFeed()
        self.tableView.dataSource = self
    }
    
    func createFeed() {
        // download del feed
        // conversione del feed in oggetti nativi
        
        self.feed = [
            FeedItem.video(
                Video.init(
                    thumbnail: #imageLiteral(resourceName: "oop"),
                    title: "Cos'è la programmazione orientata agli Oggetti",
                    date: "03/01/20115",
                    lastComment: nil)
            ),
            FeedItem.post(
                Post.init(
                    title: "Come utilizzare il database locale di Realm con Swift",
                    date: "05/01/2115",
                    image: #imageLiteral(resourceName: "realm")
                )
            ),
            FeedItem.post(
                Post.init(
                    title: "Variabili e costanti con il linguaggio Swift",
                    date: "04/01/2115",
                    image: #imageLiteral(resourceName: "var")
                )
            ),
            FeedItem.video(
                Video.init(
                    thumbnail: #imageLiteral(resourceName: "cell"),
                    title: "Impariamo a creare una TableView con più di una Prototype Cells con il linguaggio Swift",
                    date: "04/01/20115",
                    lastComment: Comment.init(
                        text: "Voglio condividere con voi un problema relativo alla mia applicazione. Non riesco a creare",
                        authorImage: #imageLiteral(resourceName: "author"))
                )
            )
        ]
        
        /*
         - Utilizza questo feed se stai provando la generazione delle celle con il casting
         - ricordati di cambiare il tipo di dato dell'array in [Any]
         
        self.feed = [
            Post.init(
                title: "Come utilizzare il database locale di Realm con Swift",
                date: "05/01/2115",
                image: UIImage.init()
            ),
            Video.init(
                thumbnail: UIImage.init(),
                title: "Impariamo a creare una TableView con più di una Prototype Cells con il linguaggio Swift",
                date: "04/01/20115",
                lastComment: Comment.init(
                    text: "Voglio condividere con voi un problema relativo alla mia applicazione. Non riesco a creare",
                    authorImage: UIImage.init())
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
        ] */
        
    }


}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.feed.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let element = self.feed[indexPath.row]
        
        switch element {
        case .post(let post):
            let cell = tableView.dequeueReusableCell(withIdentifier: "Post", for: indexPath) as! PostTableViewCell
            cell.titlePostLabel.text = post.title
            cell.dateLabel.text = post.date
            cell.postImageView.image = post.image
            return cell
            
        case .video(let video):
            let cell = tableView.dequeueReusableCell(withIdentifier: "Video", for: indexPath) as! VideoTableViewCell
            cell.videoTitleLabel.text = video.title
            cell.dateLabel.text = video.date
            cell.thumbnailImageView.image = video.thumbnail
            if (video.lastComment == nil) {
                cell.commentStack.isHidden = true
                cell.commentInfoLabel.text = "Write the first comment"
            } else {
                cell.commentStack.isHidden = false
                cell.commentInfoLabel.text = "Comments"
                cell.commentTextLabel.text = video.lastComment?.text
                cell.commentAuthorImageView.image = video.lastComment?.authorImage
            }
            return cell
        }
    
    }
    
    /*
     
     - Generazione delle celle controllando i type (is) o eseguendo un casting (as)
     - Va benissimo come metodo alternativo alla gestione dei dati con Enum (è più veloce da implementare
       ma può portare ad errori)
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let element = self.feed[indexPath.row]
        
        if let video = element as? Video { // element is Video
            let cell = tableView.dequeueReusableCell(withIdentifier: "Video", for: indexPath) as! VideoTableViewCell
            cell.videoTitleLabel.text = video.title
            cell.dateLabel.text = video.date
            cell.commentTextLabel.text = video.lastComment?.text
            return cell
        }
        
        if let post = element as? Post { // element is Post
            let cell = tableView.dequeueReusableCell(withIdentifier: "Post", for: indexPath) as! PostTableViewCell
            cell.titlePostLabel.text = post.title
            cell.dateLabel.text = post.date
            return cell
        }
        
        return UITableViewCell.init()
    } */
    

    
}

