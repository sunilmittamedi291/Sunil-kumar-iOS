//
//  ResultModel.swift
//  TestAssignmentTask
//
//  Created by Sunil Kumar on 19/01/24.
//

import Foundation


struct ResultModel: Decodable {
    let total_count: Int?
    let incomplete_results: Bool?
    let items: [ResultItemsModel]?
}
struct ResultItemsModel: Decodable {
    let login: String?
    let type: String?
    let avatar_url: String?
}
