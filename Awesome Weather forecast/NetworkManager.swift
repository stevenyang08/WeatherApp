//
//  NetworkManager.swift
//  Awesome Weather forecast
//
//  Created by Julius on 3/29/19.
//

import Foundation
import Alamofire

typealias NetworkCompletionHandler<T:Decodable> =  (T?) -> ()

class NetworkManager {
    
    let decoder: JSONDecoder
    
    init() {
        decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
    }
    
    final func performRequest<T:Decodable>(path: String,
                                             method: HTTPMethod,
                                             params: [String: Any]?,
                                             headers: [String: String]?,
                                             then completion:@escaping NetworkCompletionHandler<T>) {
        var encoding: ParameterEncoding = JSONEncoding.default
        
        if method == .get {
            encoding = URLEncoding.default
        }
        
        Alamofire.request(path, method: method, parameters: params, encoding: encoding, headers: headers)
            .validate()
            .responseJSON { [weak self] (response) in
                guard let self = self else { return }
                
                var responseModel: T? = nil
                
                guard let responseData = response.data else {
                    completion(responseModel)
                    return
                }
                
                do {
                    responseModel = try self.decoder.decode(T.self, from: responseData)
                }catch let error {
                    print("Error during response decoding: \(error)")
                }
                
                completion(responseModel)
        }
    }
}

class NetworkManagerV1 : NetworkManager, NetworkRequestManager {
    
    func getForecast(latitude: Double, longitude: Double, time: TimeInterval?,  params: [String: Any]?, then completion: @escaping NetworkCompletionHandler<ForecastResponse>) {
        let urlStr = EndPoints.urlStringForForecast(latitude: latitude, longitude: longitude, time: time)
        self.performRequest(path: urlStr, method: .get, params: params, headers: nil, then: completion)
    }
    
}
