//
//  ProfileView.swift
//  LeCheese
//
//  Created by Raphael Cerqueira on 11/08/20.
//  Copyright © 2020 Raphael Cerqueira. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color("yellow").edgesIgnoringSafeArea(.top)
            
            VStack {
                HStack {
                    Text("Profile")
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
