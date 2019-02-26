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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        FirebaseApp.configure()
        var ref = Database.database().reference()
        
        ref.observe(.value, with: { (snapshot) in
            for child in snapshot.children { //even though there is only 1 child
                let snap = child as! DataSnapshot
                //                let dict = snap.value as? NSDictionary
                guard let dict = snap.value as? [String: AnyObject] else {continue}
                for (joke, item) in dict ?? [:] {
                    let myJokeCollection = Jokes(fromDict: item as! [String : AnyObject]);
                    print(myJokeCollection)
                    print(myJokeCollection.postUser)
                    }
                
                
            }
        })
        
       
    }


}
struct Jokes {
    var postUser: String?
    var punchline: String?
    var rating: Int?
    var setup: String?
    
    init(fromDict dict:[String: AnyObject]) {
        self.postUser = dict["PostUser"] as? String
        self.punchline = dict["Punchline"] as? String
        self.rating = dict["Rating"] as? Int
        self.setup = dict["Setup"] as? String
        
    }
}

