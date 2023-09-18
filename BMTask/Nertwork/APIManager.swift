//
//  APIManager.swift
//  BMTask
//
//  Created by Hamdy Youssef on 11/08/2023.
//

import Foundation
import Alamofire

class APIManager {
    
    
    static func getMovies(parameter: [String: Any], completion: @escaping (_ error: Error?, _ mediaArr: [Media]?) -> Void) {
        
        //        AF.request(URLs.mediaSearch, method: .get, parameters: parameter).responseJSON { response in
        //                    switch response.result {
        //                    case .success(let value):
        //                        if let json = value as? [String: Any] {
        //                            print(json)
        //                        }
        //                    case .failure(let error):
        //
        //                        print(error)
        //                    }
        //                }
        //             MARK: - Get
        
        //        AF.request(URLs.employess, method: HTTPMethod.post, parameters: parameter, encoding: URLEncoding.queryString).response { response in print(response)
        
        AF.request(URLs.mediaSearch, method: .get, parameters: parameter).response { response in
            guard response.error == nil else {
                print(response.error!)
                completion (response.error!, nil)
                return
            }
            
            guard let data = response.data else {
                print(Networking.noData)
                return
            }
            do {
                let decoder = JSONDecoder()
                let mediaRes = try decoder.decode(MediaResponse.self, from: data)
                let mediaArr = mediaRes.results
                for media in mediaArr {
                    print(media.kind)
                    print(media.artistName)
                    print(media.previewUrl ?? "Not Found")
                    print(media.artworkUrl100)
                }
                completion(nil, mediaArr)
                
            } catch let error {
                print(error)
                completion(error, nil)
                
            }
            
        }
    }
    
    static func getEmployees(parameter: [String: String], completion: @escaping (_ error: Error?, _ empArr: [Employee]?) -> Void) {
        // MARK: - Post
        
        //        AF.request(URLs.employess, method: HTTPMethod.post, parameters: parameter, encoding: URLEncoding.default, headers: nil).response { response in print(response)
        //
        //            guard response.error == nil else {
        //                print("Error: \(response.error!)")
        //                return
        //            }
        //            guard let value = response.value as? [String: Any] else {
        //                print("Invalid response format")
        //                return
        //            }
        //            guard let status = value["status"] as? String else {
        //                print("Status not found in response")
        //                return
        //            }
        //            guard let data = value["data"] as? [String: Any] else {
        //                print("Data not found in response")
        //                return
        //            }
        //            guard let id = data["id"] as? Int else {
        //                print("ID not found in data")
        //                return
        //            }
        //
        //            print("Status: \(status)")
        //            print("Newly Created ID: \(id)")
        //
        
        // MARK: - Get
        
        AF.request(URLs.employess, method: HTTPMethod.post, parameters: nil, encoding: URLEncoding.default, headers: nil).response { response in print(response)
            
            guard response.error == nil else {
                print(response.error!)
                completion (response.error!, nil)
                return
            }
            
            guard let data = response.data else {
                print(Networking.noData)
                return
            }
            do {
                let decoder = JSONDecoder()
                let employeeRes = try decoder.decode(EmployeesResponse.self, from: data)
                let employeeArr = employeeRes.data
                for em in employeeArr {
                    print(em.name)
                }
                completion(nil, employeeArr)
                
            } catch let error {
                print(error)
                completion(error, nil)
                
            }
            
        }
        
    }
}
    
    
