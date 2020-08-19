//
//  ContentView.swift
//  LeCheese
//
//  Created by Raphael Cerqueira on 11/08/20.
//  Copyright © 2020 Raphael Cerqueira. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        let color = UIColor(red: 249/255, green: 218/255, blue: 73/255, alpha: 1.0)
        UITabBar.appearance().barTintColor = color
    }
    
    @State var isMenuVisible = false
    
    var body: some View {
        ZStack {
            TabView {
                HomeView(report: self.report, feed: feedData[0])
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                }
                
                SearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                }
                
                ScanView()
                    .tabItem {
                        Image(systemName: "camera")
                        Text("Scan")
                }
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Profile")
                }
            }
            .accentColor(.black)
            
            if self.isMenuVisible {
                ReportView(isVisible: $isMenuVisible)
            }
        }
    }
    
    func report() {
        self.isMenuVisible.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
