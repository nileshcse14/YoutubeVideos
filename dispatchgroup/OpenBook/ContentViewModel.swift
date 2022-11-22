import Foundation

class ContentViewModel: ObservableObject {
    @Published var bookList = [Doc]()
    
    let group = DispatchGroup()
    
    private var books = [Doc]()
    
    let queue = DispatchQueue(label: "com.openbook.queue", qos: .background, attributes: .concurrent)
    
    
    
    func fetchInitialData() {
        queue.async { [weak self] in
            self?.group.enter()
            self?.fetchBooks(title: "SwiftUI")
            self?.group.enter()
            self?.fetchBooks(title: "Android")
            self?.group.enter()
            self?.fetchBooks(title: "Kotlin")
            let timeoutResult = self?.group.wait(timeout: .now() + 5)
            
            print("I am complted")
            
            DispatchQueue.main.async {[weak self] in
                
                switch timeoutResult {
                case .success:
                    self?.bookList = self?.books ?? []
                case .timedOut:
                    print("Its time out")
                case .none:
                    break
                }
            }
        }
        
        print("I am free")
       
        
//        group.notify(queue: .main) {[weak self] in
//            self?.bookList = self?.books ?? []
//        }
    }
    
    func fetchBooks(title: String) {
        print("fetchBooks started \(title)")
        RestAPIClient.getBooks(title: title) {[weak self] results in
            self?.group.leave()
            switch results {
            case .success(let bookDetails):
                self?.books.append(contentsOf: bookDetails.docs ?? [])
                print("fetchBooks completed \(title) \(bookDetails.docs?.count ?? 0)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
