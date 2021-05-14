//
//  SignUpDataModel.swift
//  Kakao-Clone-New
//
//  Created by Subeen Park on 2021/05/14.
//

import Foundation


// MARK: - SignUpDataModel
struct SignUpDataModel: Codable {
    let success: Bool
    let message: String
    let data: SignUpData?
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(SignUpData.self, forKey: .data)) ?? nil
    }
}

struct SignUpData: Codable {
    let nickname: String
}
