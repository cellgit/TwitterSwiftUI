//
//  NavigationHeaderView.swift
//  TwitterSwiftUI
//
//  Created by paku on 2023/10/15.
//

import SwiftUI
import Kingfisher

struct NavigationHeaderView: View {
    
    @Binding var showSideMenu: Bool
    
    @Binding var user: User?
    
    var headerTitle: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                HStack {
                    Button {
                        showSideMenu.toggle()
                    } label: {
                        Group {
                            if let iconUrl = user?.profileImageUrl {
                                KFImage(URL(string: iconUrl))
                                    .resizable()
                                    .scaledToFill()
                            } else {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFill()
                            }
                        }
                        .foregroundColor(.gray)
                        .padding(.all, 4)
                        .background(.gray.opacity(0.3))
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                    }
                    
                    Spacer()
                }
                
                if headerTitle.isEmpty {
                    xLogoSmall
                } else {
                    Text(headerTitle)
                        .bold()
                        .foregroundStyle(.black)
                }
                
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    NavigationHeaderView(showSideMenu: .constant(false), user: .constant(PreviewProvider.shared.user))
}
