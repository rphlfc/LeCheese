//
//  HomeView.swift
//  LeCheese
//
//  Created by Raphael Cerqueira on 11/08/20.
//  Copyright © 2020 Raphael Cerqueira. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var report: () -> Void
    @State private var isExpanded = false
    @Namespace private var namespace
    @State var feed: Feed
    
    var body: some View {
        ZStack {
            Color("yellow").edgesIgnoringSafeArea(.top)
            
            VStack {
                Group {
                    if isExpanded {
                        DetailsView(feed: self.$feed, namespace: self.namespace, isExpanded: self.$isExpanded)
                            .opacity(self.isExpanded ? 1 : 0)
                    } else {
                        HomeListView(report: self.report, namespace: self.namespace, feed: self.$feed, isExpanded: self.$isExpanded)
                    }
                }
            }
        }
    }
}

struct HomeListView: View {
    var report: () -> Void
    var namespace: Namespace.ID
    @Binding var feed: Feed
    @Binding var isExpanded: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("Home")
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("yellow"))

            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(feedData) { feed in
                        HomeRowView(feed: feed, report: self.report, namespace: self.namespace)
                            .padding([.top, .leading, .trailing])
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    self.feed = feed
                                    self.isExpanded.toggle()
                                }
                            }
                    }
                }
            }
            .background(Color("background"))
        }
    }
}

struct HomeRowView: View {
    var feed: Feed
    var report: () -> Void
    var namespace: Namespace.ID
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {}) {
                    Image("timcook")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(25)
                        .overlay(Circle().stroke(Color.yellow, lineWidth: 3))
                }
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack(spacing: 3) {
                        Button(action: {}) {
                            Text("Yuri")
                                .foregroundColor(Color("link"))
                                .font(.system(size: 16))
                        }
                        
                        Text("added a rating to")
                            .foregroundColor(Color("text"))
                            .font(.system(size: 16))
                        Button(action: {}) {
                            Text(self.feed.cheese.name)
                                .foregroundColor(Color("link"))
                                .font(.system(size: 16))
                        }
                    }
                    .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 3) {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("ratingOn"))
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("ratingOn"))
                        Image(systemName: "star.fill")
                            .foregroundColor(Color("ratingOn"))
                        Image(systemName: "star")
                            .foregroundColor(Color("ratingOff"))
                        Image(systemName: "star")
                            .foregroundColor(Color("ratingOff"))
                        
                        Text("4 hours ago")
                            .foregroundColor(Color("gray"))
                            .font(.system(size: 16))
                    }
                }.padding(.leading, 8)
                
                Spacer()
                
                Button(action: {
                    self.report()
                }) {
                    HStack(spacing: 3) {
                        Circle()
                            .frame(width: 5, height: 5)
                            .foregroundColor(Color("gray"))
                        Circle()
                            .frame(width: 5, height: 5)
                            .foregroundColor(Color("gray"))
                        Circle()
                            .frame(width: 5, height: 5)
                            .foregroundColor(Color("gray"))
                    }
                }
            }
            
            Image(self.feed.cheese.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(15)
                .matchedGeometryEffect(id: self.feed.id, in: self.namespace, properties: .frame)
        }
        .padding()
        .background(Color("cardBackground"))
        .cornerRadius(15)
        .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color("cardBorder"), lineWidth: 1))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(report: {

        }, feed: feedData[0])
    }
}
