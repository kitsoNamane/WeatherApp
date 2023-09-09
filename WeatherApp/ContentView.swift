//
//  ContentView.swift
//  WeatherApp
//
//  Created by Kitso Namane on 09/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Text("Cupertine, CA")
                .font(.system(size: 32, weight: .medium, design: .default))
                .foregroundStyle(.white)
                .padding()
                VStack(spacing: 8) {
                    Image(systemName: "cloud.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                    
                    Text("76°")
                    .font(.system(size: 70, weight: .medium))
                    .foregroundStyle(.white)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
