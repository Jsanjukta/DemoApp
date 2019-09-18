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
    var arrQuestionAnswer = [QuestionAnswerBO]()
    
    //MARK: - View lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "QUESTION"
        setUpData()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: - Data setUp -
    func setUpData(){
        for index in 0..<4{
            let questionBo = QuestionAnswerBO()
            switch index{
            case 0:
                questionBo.strQuestion = "What is your name?"
            case 1:
                questionBo.strQuestion = "What is your age?"
            case 2:
                questionBo.strQuestion = "What is your DOB?"
            case 3:
                questionBo.strQuestion = "What is your Address?"
            default:
                questionBo.strQuestion = ""
            }
            for i in 0..<4{
                let optionB0 = OptionBO()
                optionB0.strOption = String(i + 1)
                optionB0.isOptionSelected = false
                questionBo.arrOptionBo.append(optionB0)
            }
            //questionBo.arrOptionBo
            arrQuestionAnswer.append(questionBo)
        }
    }

    //MARK: - UITebleview Delegate and Datasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrQuestionAnswer.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrQuestionAnswer[section].arrOptionBo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswersTableViewCell", for: indexPath) as! AnswersTableViewCell
        cell.lblAnswer.text = arrQuestionAnswer[indexPath.section].arrOptionBo[indexPath.row].strOption
        cell.accessoryType = arrQuestionAnswer[indexPath.section].arrOptionBo[indexPath.row].isOptionSelected ? .checkmark : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for i in 0..<4{
            arrQuestionAnswer[indexPath.section].arrOptionBo[i].isOptionSelected = false
        }
        arrQuestionAnswer[indexPath.section].arrOptionBo[indexPath.row].isOptionSelected = true
        arrQuestionAnswer[indexPath.section].strSelectedOption = arrQuestionAnswer[indexPath.section].arrOptionBo[indexPath.row].strOption
        tableView.reloadSections([indexPath.section], with: .none)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrQuestionAnswer[section].strQuestion
    }
    
    //MARK: - Button Action -
    @IBAction func btnSubmitCicked(_ sender: Any) {
        if isValidateFrom(){
            let resultVC = INITIATE.INITIATE_STORY_BOARD(identifier: "ResultViewController") as! ResultViewController
            resultVC.arrQuestionAnswer = arrQuestionAnswer
            self.navigationController?.pushViewController(resultVC, animated: true)
        } else {
            let alert = UIAlertController(title: "Alert", message: "Please answer more than 50% of question.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    //MARK: - Validation -
    func isValidateFrom() -> Bool{
        var selctedAnswer : Int = 0
        for i in 0..<arrQuestionAnswer.count{
            if arrQuestionAnswer[i].strSelectedOption != nil{
                selctedAnswer = selctedAnswer + 1
            }
        }
        if selctedAnswer > (arrQuestionAnswer.count /  2) {
            return true
        }
        return false
    }
}

