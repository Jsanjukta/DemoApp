//
//  ViewController.swift
//  DemoOne
//
//  Created by Krishna on 18/09/19.
//  Copyright © 2019 Krishna. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    //MARK: - IBOutlets and Variables -
    @IBOutlet weak var tblMcq: UITableView!
    
    //MARK: - View lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //MARK: - UITebleview Delegate and Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeftSideMenuTableViewCell", for: indexPath) as! LeftSideMenuTableViewCell
        cell.lblTitle.text = arrLeftSideMenu[indexPath.row].uppercased()
        return cell
    }
}

