//
//  handleNetworkRequest.swift
//  testAPIdata
//
//  Created by Eranga Prabath on 2024-08-17.
//

import Foundation

class NetworkManager<EndpointType:APIEndPointsAndBaseUrls>:APIClient{

    internal func handelResponse<T : Decodable>(_ endpoint: EndpointType) async throws -> T{
        let url = endpoint.baseUrl.appending(path: endpoint.endPoint)
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.urlMethod.rawValue
        endpoint.headers?.forEach({ (key,value) in
            request.setValue(value, forHTTPHeaderField: key)
        })
        request.addValue("", forHTTPHeaderField: "Authorization")
       if let parameters  = endpoint.parameters{
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters,options: .prettyPrinted)
                
            }catch{
                throw error
            }
        }
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httResponse = response as? HTTPURLResponse,
              (200...299).contains(httResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        let decodedJsonObject = try JSONDecoder().decode(T.self, from: data)
        return decodedJsonObject
    }
    
    func downloadData<T :Decodable>(endpoints: EndpointType)async throws -> T {
        return try await handelResponse(endpoints)
    }
}
