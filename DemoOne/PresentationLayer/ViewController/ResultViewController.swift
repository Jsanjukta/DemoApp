//
//  ResultViewController.swift
//  DemoOne
//
//  Created by Krishna on 18/09/19.
//  Copyright © 2019 Krishna. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    //MARK: - IBOutlets and Variables -
    @IBOutlet weak var tblResult: UITableView!
    var arrQuestionAnswer = [QuestionAnswerBO]()
    
    //MARK: - View lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        tblResult.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - UITebleview Delegate and Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrQuestionAnswer.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswersTableViewCell", for: indexPath) as! AnswersTableViewCell
        cell.lblAnswer.text = "Ans : " +  (arrQuestionAnswer[indexPath.section].strSelectedOption ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrQuestionAnswer[section].strQuestion
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
