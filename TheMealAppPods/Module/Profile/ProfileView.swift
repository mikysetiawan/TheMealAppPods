//
//  ProfileView.swift
//  TheMealAppPods
//
//  Created by Testing on 07/02/21.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            Image("miky")
                .resizable()
                .frame(width: 120, height: 120)                .aspectRatio(contentMode: .fill)
                .cornerRadius(12)
                .shadow(radius: 3)
                
            Text("Miky Setiawan")
                .font(.title)
            HStack {
                Image(systemName: "envelope")
                Text("mikysetiawan@gmail.com")
                Spacer()
            }
            Divider()
            Spacer()
        }.padding()
        
        .navigationTitle("Profile")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

