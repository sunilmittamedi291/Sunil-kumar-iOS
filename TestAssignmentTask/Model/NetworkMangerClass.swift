//
//  NetworkMangerClass.swift
//  TestAssignmentTask
//
//  Created by Sunil Kumar on 19/01/24.
//

import Foundation

class NetworkManager {
    private let maxRetries = 3
    func searchResult(for query: String,currentPage: Int, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let encodedQuery = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            completion(.failure(NSError(domain: "NetworkManager", code: 0, userInfo: [NSLocalizedDescriptionKey: "Encoding failure"])))
            return
        }
        let urlString = "https://api.github.com/search/users?q=\(encodedQuery)&login&page=\(currentPage)&per_page=10"
        print(urlString)
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "NetworkManager", code: 1, userInfo: [NSLocalizedDescriptionKey: "URL creation failure"])))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let data = data {
                completion(.success(data))
            }
        }

        // Start the URLSession task
        task.resume()
    }
}

