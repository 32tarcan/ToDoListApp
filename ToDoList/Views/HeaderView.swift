//
//  HeaderView.swift
//  ToDoList
//
//  Created by Bahadır Tarcan on 14.06.2023.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
            ZStack {
                RoundedRectangle(cornerRadius: 0)
                    .foregroundColor(background)
                    .rotationEffect(Angle(degrees: angle))
                
                VStack {
                    Text(title)
                        .font(.system(size: 50))
                        .foregroundColor(Color.white)
                        .bold()
                    
                    Text(subtitle)
                        .font(.system(size: 25))
                        .foregroundColor(Color.white)
                    
                }
                .padding(.top, 110)
                
            }
            .frame(width: UIScreen.main.bounds.width * 3,
                   height: 280)
            .offset(y: -150)
            
            
            
        }
    }
    
    struct HeaderView_Previews: PreviewProvider {
        static var previews: some View {
            HeaderView(title: "Title",
                       subtitle: "Subtitle",
                       angle: 15,
                       background: .blue)
            
        }
    }

