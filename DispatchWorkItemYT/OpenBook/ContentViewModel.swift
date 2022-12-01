import Foundation

@MainActor
class ContentViewModel: ObservableObject {
    @Published var bookList = [Doc]()
    
    var dispatchWorkItem: DispatchWorkItem?
    
    func fetchBooks(title: String) {
        dispatchWorkItem?.cancel()
        
        let requestWorkItem = DispatchWorkItem { [weak self] in
            print("Request started for \(title)")
            RestAPIClient.getBooks(title: title) {[weak self] results in
                switch results {
                case .success(let bookDetails):
                    self?.bookList = bookDetails.docs ?? []
                    print("Response succcess for \(title) \(bookDetails.docs?.count ?? 0)")
                case .failure( _):
                    print("Response failed for \(title)")
                }
            }
        }
        
        dispatchWorkItem = requestWorkItem
        DispatchQueue.global().asyncAfter(deadline: .now() + .milliseconds(500), execute: requestWorkItem)
       
    }
    
}
