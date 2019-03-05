//
//  JokeViewController.swift
//  BestWorstDadJokes
//
//  Created by Student on 3/2/19.
//  Copyright © 2019 BGoforth. All rights reserved.
//

import UIKit
import Firebase
class JokeViewController: UIViewController {

    var PostUser: String
    var SetUp: String
    var Punchline: String
    var Rating: Int
    var JokeId: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("made it")
        
        // This assigns values to model instantiated in Prepare Segue in ViewController
        self.setupLabel.text = self.SetUp
        self.punchlineLabel.text = self.Punchline
        self.ratingLabel.text = String(self.Rating)
        self.posterLabel.text = self.PostUser

    }
    
    //Setup labels to display data retrieved from Prepare Segue in ViewController
    @IBOutlet weak var setupLabel: UILabel!
    @IBOutlet weak var punchlineLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var posterLabel: UILabel!
    
    // Rate joke by pushing new increment to Firebase Database
    @IBAction func rateJoke(_ sender: Any) {
        var newRating = self.Rating + 1
        var ref = Database.database().reference().child("jokes").child(self.JokeId)
        ref.updateChildValues([
            "Rating": newRating
            ])
        self.ratingLabel.text = String(newRating)
    }
    
    // Initialize the Controller values
    required init?(coder aDecoder: NSCoder) {
        self.PostUser = ""
        self.SetUp = ""
        self.Punchline = ""
        self.Rating = 0
        self.JokeId = ""
        super.init(coder: aDecoder)
        
        print("this is the passed info\(self.PostUser)")
    }
    
}
