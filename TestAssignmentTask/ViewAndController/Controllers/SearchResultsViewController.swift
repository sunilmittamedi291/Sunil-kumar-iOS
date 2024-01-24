//
//  SearchResultsViewController.swift
//  TestAssignmentTask
//
//  Created by Sunil Kumar on 19/01/24.
//

import UIKit

class SearchResultsViewController: UIViewController {
    
    @IBOutlet weak var resultTableview: UITableView!
    let viewModel = SearchViewModel()
    var searchString: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "SearchListTableViewCell", bundle: nil)
        resultTableview.register(nib, forCellReuseIdentifier: "SearchListTableViewCell")
        resultTableview.delegate = self
        resultTableview.dataSource = self
        
        if let searchText = searchString {
            viewModel.searchListData(for: searchText)
        }
        
        viewModel.callBack = {[weak self] (success, error) in
            
            DispatchQueue.main.async {
                if success {
                    self?.resultTableview.reloadData()
                    
                } else {
                    let alert = UIAlertController(title: "Alert", message: error, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self?.present(alert, animated: true, completion: nil)
                }
            }
           
        }
        
    }
    
}
extension SearchResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.searchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchListTableViewCell", for: indexPath) as! SearchListTableViewCell
        cell.config(model: viewModel.searchResult[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            let lastRow = indexPath.row
        if lastRow == viewModel.searchResult.count - 1 {
                // Fetch next page when reaching the last row
            viewModel.currentPage += 1
            if let searchText = searchString {
              
                    self.viewModel.searchListData(for: searchText)
                
            }
               
            }
        }
    
    
}
