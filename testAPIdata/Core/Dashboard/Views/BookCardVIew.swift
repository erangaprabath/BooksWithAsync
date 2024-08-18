//
//  BookCardVIew.swift
//  testAPIdata
//
//  Created by Eranga Prabath on 2024-08-18.
//

import SwiftUI

struct BookCardVIew: View {
    var bookData:BookData
    var body: some View {
        HStack(alignment:.top){
            BookImageView
            BookName
        }.padding()
            .background(
                RoundedRectangle(cornerRadius: 10,style: .continuous)
                .fill(Color.cyan.opacity(0.05))
                .shadow(color: .gray, radius: 5, x: 0, y: 5)
            )
            
    }
}
extension BookCardVIew{
    private var BookImageView:some View{
        VStack{
            AsyncImage(url: URL(string: "https://marketplace.canva.com/EAFaQMYuZbo/1/0/1003w/canva-brown-rusty-mystery-novel-book-cover-hG1QhA7BiBU.jpg")) { Image in
                Image.resizable()
                    .scaledToFill()
                    .frame(width: 100,height: 150)
            } placeholder: {
                Rectangle()
                    .foregroundStyle(Color.gray.opacity(0.2))
                    .frame(width: 100,height: 150)
            }.clipShape(RoundedRectangle(cornerRadius: 10))

        }
    }
    private var BookName:some View{
        VStack(alignment:.leading){
            Text("\(bookData.title)  (\(bookData.year))")
                .font(.callout)
                .fontWeight(.bold)
            Text("By \(bookData.publisher)")
                .font(.subheadline)
                .fontWeight(.medium)
            Text(bookData.handle)
                .font(.caption)
            Text(bookData.isbn)
                .font(.caption)
            Text("\(bookData.pages)")
                .font(.caption)
        }.frame(maxWidth: .infinity,alignment: .leading)
    }
}

#Preview {
    BookCardVIew(bookData: BookData(id: 1, year: 1999, title: "TEST", handle: "TEST 1", publisher: "TEST 2", isbn: "TEST 3", pages: 10, notes: ["test" ,"test 1"], createdAt: "TEST 4", villains: [Villain(name: "test 2", url: "test 3")]))
}
