//
//  ViewController.swift
//  BestWorstDadJokes
//
//  Created by Student on 2/5/19.
//  Copyright © 2019 BGoforth. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //Setup Database Reference
//    FirebaseApp.configure()
//    var ref = Database.database().reference()
      @IBOutlet weak var TableViewOutlet: UITableView!
    

    
    var dict : [String: AnyObject] = [:]
    var jokes = [Jokes]()
    var placeholderDict : [String: AnyObject] = [:]
    private let myArray: NSArray = ["First","Second","Third"]
    private var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var ref = Database.database().reference()
                ref.observe(.value, with: { (snapshot) in
                    for child in snapshot.children { //even though there is only 1 child
                        let snap = child as! DataSnapshot
                        //                let dict = snap.value as? NSDictionary
                        self.dict = snap.value as! [String: AnyObject]
                        for (joke, item) in self.dict ?? [:] {
                            let myJokeCollection = Jokes(fromDict: item as? [String : AnyObject] ?? self.placeholderDict);
                            self.jokes.append(myJokeCollection)
                            print(myJokeCollection)
                            print(myJokeCollection.postUser)
                            self.myTableView.reloadData()
                        }
                    }
                })
        
        //Below is intial example
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = 400
//        let displayHeight: CGFloat = self.view.frame.height
        let displayHeight: CGFloat = 400
        
        myTableView = UITableView(frame: CGRect(x: 0, y: 300, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "JokeCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
//        print("Value: \(myArray[indexPath.row])")
        print("Value: \(jokes[indexPath.row].setup)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JokeCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(jokes[indexPath.item].setup)"
        return cell
    }
  
}
 class Jokes {
    var postUser: String
    var punchline: String
    var rating: Int
    var setup: String
    
    init(fromDict dict:[String: AnyObject]) {
        self.postUser = dict["PostUser"] as? String ?? ""
        self.punchline = dict["Punchline"] as? String ?? ""
        self.rating = dict["Rating"] as? Int ?? 0
        self.setup = dict["Setup"] as? String ?? ""
        
    }
}

