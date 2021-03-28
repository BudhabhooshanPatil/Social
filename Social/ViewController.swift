//
//  ViewController.swift
//  Social
//
//  Created by Bhooshan Patil on 28/03/21.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.getAllUsers()
    }
    
    private func getAllUsers()
    {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        ref.child("Users").getData { (error, snapshot) in
            if let error = error {
                print("Error getting data \(error)")
            }
            else if snapshot.exists() {
                print("Got data \(snapshot.value!)")
//                self.setsUser()
            }
            else {
                print("No data available")
            }
        }
    }
    private func setsUser()
    {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        if let key = ref.child("Users").childByAutoId().key {
            
            let geo = Geo(lat: "32.09", lng: "17.087")
            let address = Address(city: "mumbai", geo: geo, street: "IIT, Powai", suite: "none", zipcode: "400076")
            let company = Company(bs: "bs", catchPhrase: "catchPhrase", name: "neebal")
            
            let meta = UserMeta(email: "demo@email.com", id: key, name: "bhooshan", phone: "89761630", username: "bhooshan_patil", website: "website")
            
            let user = User(address: address, company: company, userMeta: meta)
            
            do {
                let user_data = try JSONEncoder().encode(user)
                let json = try JSONSerialization.jsonObject(with: user_data, options: [])
                guard let dictionary = json as? [String : Any] else {
                    return
                }
                ref.child("Users").child(key).setValue(dictionary);
                
            } catch let error {
                print(error)
            }
        }
    }
}

