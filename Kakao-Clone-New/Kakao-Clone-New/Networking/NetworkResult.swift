//
//  NetworkResult.swift
//  Kakao-Clone-New
//
//  Created by Subeen Park on 2021/05/14.
//

import Foundation

enum NetworkResult<T, E> {
    case success(T, E?)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
