//
//  ContentViewModel.swift
//  UnderstandingLoop
//
//  Created by Nilesh on 08/10/22.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    
    @Published var timer: Int = 0
    @Published var commonTimerValue: Int = 0
    @Published var isLoading = false
    @Published var imageData: Data?
    private var bag = Set<AnyCancellable>()
    
    init() {
        createDefaultTimer()
        createCommonTimer()
    }
    
    func loadImage() {
        isLoading = true
        guard let url = URL(string: "https://picsum.photos/300/600") else {
            isLoading = false
            return
        }
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                if let data = $0 {
                    self?.imageData = data
                }
                self?.isLoading = false
            }
            .store(in: &bag)
        
    }
   
    
    func createDefaultTimer() {
        let timer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target: self,
                                         selector: #selector(defaultTimer),
                                         userInfo: nil,
                                         repeats: true)
        RunLoop.current.add(timer, forMode: .default)
    }
    
    func createCommonTimer() {
        let timer = Timer.scheduledTimer(timeInterval: 1.0,
                                         target: self,
                                         selector: #selector(commonTimer),
                                         userInfo: nil,
                                         repeats: true)
        RunLoop.current.add(timer, forMode: .common)
    }
    
    @objc func defaultTimer() {
        timer = timer + 1
    }
    
    @objc func commonTimer() {
        commonTimerValue = commonTimerValue + 1
        if commonTimerValue == 5 {
            loadImage()
        }
    }
    
    
    
    
    
}
