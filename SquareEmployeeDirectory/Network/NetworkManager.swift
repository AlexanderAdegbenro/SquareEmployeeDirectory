//
//  Manager.swift
//  SquareEmployeeDirectory
//
//  Created by Alexander Adgebenro on 9/8/22.
//

import UIKit


final class NetworkManager: NetWorkManagerProtocol {
    
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    
    func fetchAllEmployees(url: URL?, completion: @escaping(Result<[EmployeeData], APIError>) -> Void)  {
        guard let url = url else {
            let error = APIError.invalidURL
            completion(Result.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            
            if (error as? URLError) != nil {
                completion(Result.failure(APIError.invalidURL))
            } else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.invalidResponse))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let employees = try decoder.decode(Employees.self, from: data).employees
                    completion(Result.success(employees))
                    
                } catch {
                    completion(Result.failure(APIError.unableToComplete))
                } 
            }
        }

        task.resume()
    }
    
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void ) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task =  URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        task.resume()
    }
}
