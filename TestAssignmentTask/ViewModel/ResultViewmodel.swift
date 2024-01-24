//
//  ResultViewmodel.swift
//  TestAssignmentTask
//
//  Created by Sunil Kumar on 19/01/24.
//

import Foundation

class SearchViewModel {
    
    var searchResult = [ResultItemsModel]()
    
    var callBack: ((_ success: Bool, _ error: String) -> ())?
    let networkManager = NetworkManager()
    let jsonParser = JSONParser()
    var currentPage = 1
    
    func searchListData(for query: String) {
        networkManager.searchResult(for: query, currentPage: currentPage) {[weak self] result in
            switch result {
            case .success(let data):
                let parseResult = self?.jsonParser.parseResultItem(from: data)
                switch parseResult {
                case .success(let result):
                    if let result = result.items {
                        self?.searchResult.append(contentsOf: result)
                        self?.callBack?(true, "Success")
                    } else {
                        self?.callBack?(true, "No Result")
                    }
                    
                case.failure(let error ):
                    self?.callBack?(false, error.localizedDescription)
                case .none:
                    self?.callBack?(false, "")
                }
            case .failure(let error):
                self?.callBack?(false, error.localizedDescription)
                
            }
        }
    }
}
