//
//  ViewController.swift
//  Registration Form with Core Data
//
//  Created by Admin on 09/07/1940 Saka.
//  Copyright © 1940 Kapil. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource,dataParsingDelegate {
    
    var array = [[String : String]]()
    
    @IBOutlet weak var tableData: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableData?.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }

    @IBAction func barItem(_ sender: UIBarButtonItem) {
        let move = self.storyboard?.instantiateViewController(withIdentifier: "RegistrationVC") as! RegistrationViewController
        move.delegate = self
        self.navigationController?.pushViewController(move, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.lastNameLbl.text = array[indexPath.row]["firstName"]
        cell.firstNameLbl.text = array[indexPath.row]["state"]
        return cell
    }
    
    func dataPasingToVC(data: Details) {
        print("Data is :\(data)")
        let dic = ["firstName" : data.firstName,"lastName": data.lastName,"email":data.email,"password":data.password,"city":data.city,"state":data.state,"pincode":data.pincode]
        //print(dic)
        array.append(dic)
        //print(array)
        tableData.reloadData()
       
    }
    
    
}

