//
//  Protocal.swift
//  testAPIdata
//
//  Created by Eranga Prabath on 2024-08-18.
//

import Foundation

protocol APIEndPointsAndBaseUrls{
    var baseUrl:URL { get }
    var endPoint:String { get }
    var urlMethod:HttpMethod { get }
    var headers:[String : String]? { get }
    var parameters:[String : Any]? { get }
}

extension APIEndPointsAndBaseUrls {
    var headers : [String:String]?{
        return nil
    }
    
    var parameters : [String : Any]?{
        return nil
    }
}

enum APIError:Error{
    case invalidUrl
    case invalidRespons
    case badResponse
}

enum HttpMethod:String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

protocol APIClient {
    associatedtype EndpointType:APIEndPointsAndBaseUrls
    func handelResponse<T : Decodable>(_ endpoint:EndpointType) async throws -> T
}
