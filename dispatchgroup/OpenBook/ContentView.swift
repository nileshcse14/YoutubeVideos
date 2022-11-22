import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ContentViewModel()
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
            if viewModel.bookList.isEmpty {
                Text("No search result")
            } else {
                List {
                    ForEach(viewModel.bookList, id: \.self) { doc in
                        VStack {
                            Text(doc.title)
                            Text(doc.author_name.first ?? "")
                            Text(doc.key)
                        }
                    }
                }
                
            }
                
        }.onChange(of: searchText) { value in
            viewModel.fetchBooks(title: value)
        }
        .navigationTitle("Search books")
        .onAppear {
            viewModel.fetchInitialData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


