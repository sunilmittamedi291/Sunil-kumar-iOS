//
//  ViewController.swift
//  TestAssignmentTask
//
//  Created by Sunil Kumar on 19/01/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func SubmitButtonTapped(_ sender: UIButton) {
        guard let searchText = self.searchTextField.text, searchText.count != 0 else {
            let alert = UIAlertController(title: "Alert", message: "Please enter search text", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let searchListController = storyboard.instantiateViewController(withIdentifier: "SearchResultsViewController") as? SearchResultsViewController {
            searchListController.searchString = searchText
            navigationController?.pushViewController(searchListController, animated: true)
        }
        
    }
    
    
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

