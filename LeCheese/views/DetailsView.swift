//
//  DetailsView.swift
//  LeCheese
//
//  Created by Raphael Cerqueira on 11/08/20.
//  Copyright © 2020 Raphael Cerqueira. All rights reserved.
//

import SwiftUI

struct DetailsView: View {
    @Binding var feed: Feed
    var namespace: Namespace.ID
    @Binding var isExpanded: Bool
    
    var body: some View {
        ZStack {
            Color("yellow").edgesIgnoringSafeArea(.top)
            
            VStack {
                VStack {
                    ZStack {
                        HStack {
                            Button(action: {
                                withAnimation {
                                    self.isExpanded.toggle()
                                }
                            }, label: {
                                Label("Home", systemImage: "chevron.left")
                                    .font(.system(size: 22))
                                    .foregroundColor(.black)
                            })
                            
                            Spacer()
                            
                            Button(action: {}, label: {
                                Image(systemName: "square.and.arrow.up.fill")
                                    .foregroundColor(.black)
                            })
                        }
                        
                        Text(self.feed.cheese.name)
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                    }
                    .padding()
                    .background(Color("yellow"))
                }
                
                DetailsViewBody(feed: self.$feed, namespace: self.namespace)
            }
            .background(Color.white)
        }
    }
}

struct DetailsViewBody: View {
    @Binding var feed: Feed
    var namespace: Namespace.ID
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {
                Image(self.feed.cheese.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: self.feed.id, in: self.namespace, properties: .frame)
                
                Rectangle()
                    .frame(height: 5)
                    .foregroundColor(Color("yellow"))
                    .offset(y: -8)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text(self.feed.cheese.name)
                        .autocapitalization(.allCharacters)
                        .font(.system(size: 42))
                    //.fontWeight(.bold)
                    
                    Button(action: {}, label: {
                        HStack {
                            Image(systemName: "arrowtriangle.right")
                                .offset(x: 2)
                                .foregroundColor(Color("link"))
                                .frame(width: 30, height: 30)
                                .background(Color.blue.opacity(0.3))
                                .cornerRadius(15)
                            
                            Text("Pronunciation")
                                .font(.system(size: 18))
                                .foregroundColor(Color("link"))
                        }
                    })
                    
                    HStack(spacing: 30) {
                        ForEach(0..<5, id: \.self) { i in
                            Image(systemName: "star")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color("yellow"))
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color("yellow"), lineWidth: 3))
                    
                    Button(action: {}) {
                        Text("Buy Now")
                            .foregroundColor(.black)
                            .font(.system(size: 22))
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("yellow"))
                    .cornerRadius(5)
                    
                    Button(action: {}) {
                        Text("Add to Wishlist")
                            .foregroundColor(.black)
                            .font(.system(size: 22))
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color("yellow"), lineWidth: 3))
                    
                    DetailsInfoView()
                }
                .padding()
                
                Spacer()
            }
            .background(Color.white)
        }
    }
}

struct DetailsInfoView: View {
    var body: some View {
        VStack(alignment: .leading) {
            SpecsView(image: "flag.fill", title: "Country", value: "France")
            SpecsView(image: "mappin", title: "Region", value: "Normandy, Camembert")
            SpecsView(image: "location", title: "Milk", value: "Cow")
            SpecsView(image: "folder.fill", title: "Type", value: "soft, artisan, soft-ripened")
            SpecsView(image: "folder.fill", title: "Texture", value: "chalky, runny, smooth, soft, soft-ripened, supple")
            SpecsView(image: "folder.fill", title: "Color", value: "pale yellow")
            //SpecsView(image: "folder.fill", title: "Flavor", value: "buttery, creamy, milky, sweet")
            //SpecsView(image: "folder.fill", title: "Aroma", value: "earthy")
            //SpecsView(image: "folder.fill", title: "Vegetarian", value: "no")
            
            Text("Marie Harel created the original Camembert cheese from raw milk in Normandy, France in 1791. Today, however, a very small percentage of producers ...")
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
                .padding(.top)
            
            Button(action: {}, label: {
                Text("Read more")
                    .foregroundColor(.blue)
            })
            
            ReviewsView()
                .padding(.top)
            
            Button(action: {}) {
                Text("Sugest an edit")
                    .foregroundColor(.black)
                    .font(.system(size: 22))
            }
            .frame(maxWidth: .infinity)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color("yellow"), lineWidth: 3))
            .padding(.top)
        }
    }
}

struct SpecsView: View {
    var image: String
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
            Text("\(title): ")
                .fontWeight(.bold)
            Text(value)
        }
        .padding(.top, 4)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}


