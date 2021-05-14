//
//  SignInService.swift
//  Kakao-Clone-New
//
//  Created by Subeen Park on 2021/05/14.
//

import Foundation
import Alamofire

struct SignInDataService{
    static let shared = SignInDataService()
    
    private func makeParameter(email : String, password : String) -> Parameters
    {
        return ["email" : email,
                "password" : password]
    }
    
    func signIn(email : String,
               password : String,
               completion : @escaping (NetworkResult<Any, Any>) -> Void)
    {
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = AF.request(APIConstants.signInURL,
                                     method: .post,
                                     parameters: makeParameter(email: email, password: password),
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        
        dataRequest.responseData { dataResponse in
            
            dump(dataResponse)
            
            switch dataResponse.result {
            case .success:
            
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            
            case .failure: completion(.pathErr)
                
            }
        }
                                            
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any, Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try?decoder.decode(SignInDataModel.self, from: data)
        else { return .pathErr}
        
        switch statusCode {
            
        case 200:
            return .success(decodedData.message, decodedData.data?.token)
        case 400: return .requestErr(decodedData.message)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    

    
}
