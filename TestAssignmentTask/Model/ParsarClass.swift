//
//  ParsarClass.swift
//  TestAssignmentTask
//
//  Created by Sunil Kumar on 19/01/24.
//

import Foundation

class JSONParser {

    func parseResultItem(from data: Data) -> Result<ResultModel, Error> {
        do {
            let decoder = JSONDecoder()
            let user = try decoder.decode(ResultModel.self, from: data)
            return .success(user)
        } catch {
            return .failure(error)
        }
    }

   
    }

