//
//  DashboardMainView.swift
//  testAPIdata
//
//  Created by Eranga Prabath on 2024-08-18.
//

import SwiftUI

struct DashboardMainView: View {
    @StateObject private var dashBoardViewModel = DashboardViewModel(networkManager: NetworkManager())
    var body: some View {
        VStack{
            ScrollView{
                ForEach(dashBoardViewModel.bookData,id: \.id){ singleBook in
                    BookCardVIew(bookData: singleBook)
                        .padding(.horizontal)
                }
            }
        }.task {
            await dashBoardViewModel.dowloadAllBooks()
        }
    }
}

#Preview {
    DashboardMainView()
}
