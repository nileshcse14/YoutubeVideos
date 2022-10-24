

import SwiftUI


struct ContentView: View {
    @ObservedObject private var viewModel = ContentViewModel()
    @State private var searchText = "Developer"
    @State private var isViewLoaded: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.results) { result in
                    NavigationLink(destination: EmptyView()) {
                        SearchResultRow(result: SearchResultViewModel(model: result))
                    }
                }
            }
            .searchable(text: $searchText, prompt: "")
            .onAppear {
                print("***** OnAppear *****")
            }.onDisappear {
                print("***** onDisappear *****")
            }.task {
                print("***** task *****")
            }.task(id: searchText) {
                viewModel.performSearch(searchText: searchText)
            }.onChange(of: viewModel.serviceCallStatus) { newValue in
                print("***** onChange ****")
            }.onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                print("****** onReceive *****")
            }
            
        }
    }
}

