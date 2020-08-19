//
//  SearchView.swift
//  LeCheese
//
//  Created by Raphael Cerqueira on 11/08/20.
//  Copyright © 2020 Raphael Cerqueira. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ZStack {
            Color("yellow").edgesIgnoringSafeArea(.top)
            
            VStack {
                HStack {
                    Text("Search")
                        .font(.system(size: 22))
                        .fontWeight(.semibold)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color("yellow"))
                
                Spacer()
            }
            .background(Color.white)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
