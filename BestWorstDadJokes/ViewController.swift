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
    private var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialize jokes array on load
        jokes = []
        var ref = Database.database().reference()
                ref.observe(.value, with: { (snapshot) in
                    for child in snapshot.children {
                        print(child)
                        let snap = child as! DataSnapshot
                        print(snap)
                        // Set dict as snapshot from Firebase Dictionary
                        self.dict = snap.value as! [String: AnyObject]
                        print(self.dict
                        )
                        for (joke, item) in self.dict ?? [:] {
                            let myJokeCollection = Jokes(fromDict: item as? [String : AnyObject] ?? self.placeholderDict, jokeId: joke);
                            // Add each joke to jokes array
                            self.jokes.append(myJokeCollection)
                            print(myJokeCollection)
                            print(myJokeCollection.postUser)
                            self.myTableView.reloadData()
                        }
                    }
                })
        
        //Configure Table View Display In UI
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = 355
        let displayHeight: CGFloat = 200
        
        myTableView = UITableView(frame: CGRect(x: 10, y: 220, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "JokeCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
    }
    
    // Send This indexPath.row to the JokeViewController
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(jokes[indexPath.row].setup)")
        self.performSegue(withIdentifier: "ViewJoke", sender: jokes[indexPath.row])
    }
    
    // Configure tableview count agains jokes array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    // Assign jokes setup and color to designated cellRow
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JokeCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(jokes[indexPath.item].setup)"
        cell.backgroundColor = indexPath.row % 2 == 0 ? UIColor.black.withAlphaComponent(0.05) : .white
        return cell
    }
  
    // Submit joke to Firebase database.
    @IBOutlet weak var Setup: UITextField!
    @IBOutlet weak var Punchline: UITextField!
    @IBOutlet weak var PostUser: UITextField!
    @IBAction func SubmitJoke(_ sender: Any) {
        var ref = Database.database().reference()
        ref.child("jokes").childByAutoId().setValue(["PostUser": PostUser.text,
                                                     "Punchline": Punchline.text,
                                                     "Setup": Setup.text,
                                                     "Rating": 0])
        Setup.text = ""
        Punchline.text = ""
        PostUser.text = ""
        jokes = []
        myTableView.reloadData()
    }
    
    // Prepare to pass selected jokes to JokeViewController by initializing object reference in that controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //         Get the new view controller using segue.destination.
        //         Pass the selected object to the new view controller.
        if (segue.identifier == "ViewJoke") {
                        // pass data to next view
                        if let joke = sender as? Jokes {
                            let controller = segue.destination as! JokeViewController
                                print(joke)
                            controller.PostUser = joke.postUser
                            controller.SetUp = joke.setup
                            controller.Punchline = joke.punchline
                            controller.Rating = joke.rating
                            controller.JokeId = joke.jokeIdItem as! String
                        }
            
                    }
    }
    
}
//Jokes Class
 class Jokes {
    var postUser: String
    var punchline: String
    var rating: Int
    var setup: String
    var jokeIdItem: Any
    
    init(fromDict dict:[String: AnyObject], jokeId item:Any) {
        self.postUser = dict["PostUser"] as? String ?? ""
        self.punchline = dict["Punchline"] as? String ?? ""
        self.rating = dict["Rating"] as? Int ?? 0
        self.setup = dict["Setup"] as? String ?? ""
        self.jokeIdItem = item
    }
}


