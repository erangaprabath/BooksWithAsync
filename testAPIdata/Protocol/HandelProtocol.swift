//
//  HandelProtocol.swift
//  testAPIdata
//
//  Created by Eranga Prabath on 2024-08-18.
//

import Foundation

enum networkEndpoints:APIEndPointsAndBaseUrls{
    case getPokemonData
    
    var baseUrl: URL{
        guard let url = URL(string: "https://stephen-king-api.onrender.com/api/") else {
            fatalError()
        }
        return url
    }
    
    var endPoint: String{
        switch self {
            case .getPokemonData:
                return "books"
        }
    }
    
    var urlMethod: HttpMethod{
        switch self {
            case .getPokemonData:
                return.get
        }
    }
    var headers: [String : String]?{
        return nil
    }
    
    var parameters: [String : Any]?{
        switch self {
            case .getPokemonData:
                return nil
        }
    }
    
  
}
