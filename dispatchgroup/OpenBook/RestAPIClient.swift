import Foundation
import Alamofire

/// This class is an interface to call the rest API.

class RestAPIClient {
    
    /// Generic method to make the API request and decode the data to generic type.
    private static func request<T: Codable>(type: T.Type,
                                            route: APIRouter,
                                            completion:@escaping (Result < T,
                                                                           APIError>)
                                                -> Void) {
        
        AF.request(route).response { response in
            let result = response.result
            switch result {
            case .success(let data):
                guard let data = data else {
                    completion(.failure(.runtimeError("No Proper data recieved")))
                    return
                }
                
                do {
                    let obj = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(obj))
                } catch(let error) {
                    completion(.failure(.runtimeError(error.localizedDescription)))
                }
            case .failure(let error):
                completion(.failure(.runtimeError(error.localizedDescription)))
            }
        }
        
    }
    
    
    static func getBooks(title: String, completion:@escaping (Result<BooksDetail, APIError>) -> Void) {
        return request(type: BooksDetail.self, route: APIRouter.getBooks(title: title),
                       completion: completion)
        
    }
    
    
    
    
}
