//
//  ReviewsView.swift
//  LeCheese
//
//  Created by Raphael Cerqueira on 19/08/20.
//  Copyright © 2020 Raphael Cerqueira. All rights reserved.
//

import SwiftUI

struct ReviewsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("REVIEWS")
                .font(.system(size: 28, weight: .bold))
            
            HStack {
                Text("4.0")
                    .font(.system(size: 40, weight: .medium))
                
                VStack(alignment: .leading) {
                    RatingView(rating: 4)
                    
                    Text("119 ratings")
                        .foregroundColor(.gray)
                }
            }
            
            RatingRowView(rating: 3)
            RatingRowView(rating: 4)
            RatingRowView(rating: 2, text: "Wishes it was brie. More flavor but less texture.")
        }
    }
}

struct ReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsView()
    }
}

struct RatingView: View {
    var rating: Int
    
    var body: some View {
        HStack {
            ForEach(0 ..< 5) { i in
                Image(systemName: i < rating ? "star.fill" : "star")
                    .foregroundColor(i < rating ? Color("yellow") : .gray)
            }
        }
    }
}

struct RatingRowView: View {
    var rating: Int
    var text: String?
    
    var body: some View {
        VStack(alignment: .leading)  {
            HStack {
                Image("timcook")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text("Tim Cook")
                    
                    Text("2 days ago")
                        .foregroundColor(.gray)
                }
            }
            
            RatingView(rating: rating)
            
            Text(text ?? "")
                .padding(.top, 4)
        }
        //.padding(.vertical)
    }
}
