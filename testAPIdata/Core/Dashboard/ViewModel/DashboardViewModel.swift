//
//  DashboardViewModel.swift
//  testAPIdata
//
//  Created by Eranga Prabath on 2024-08-18.
//

import Foundation

class DashboardViewModel:ObservableObject{
    @Published var bookData:[BookData] = []
    private var networkManager:NetworkManager<networkEndpoints>
    
    init(networkManager: NetworkManager<networkEndpoints>) {
        self.networkManager = networkManager
    }
    
    func dowloadAllBooks() async{
        let booksEndpoints = networkEndpoints.getPokemonData
        Task{
            do{
                let fetchAllBooks:AllBooks = try await networkManager.downloadData(endpoints: booksEndpoints)
                await MainActor.run {
                    self.bookData = fetchAllBooks.data
                    print(fetchAllBooks)
                }
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}
