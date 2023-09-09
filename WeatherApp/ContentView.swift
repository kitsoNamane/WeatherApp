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
            BackgroudView(topColor: .blue, bottomColor: Color("lightBlue"))
            VStack(alignment: .center) {
                Text("Cupertino, CA")
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
                .padding(.bottom, 40)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "sun.max.fill", temperature: 74)
                    
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.fill", temperature: 78)
                    
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.rain.fill", temperature: 64)
                    
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.hail.fill", temperature: 50)
                    
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.snow.fill", temperature: 44)
                }
                Spacer()
                
                Button {
                    print("tapped")
                } label: {
                    Text("Change Day Time")
                    .frame(width: 280, height: 50)
                    .background(Color.white)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .cornerRadius(10)
                }
                Spacer()
            }
        }
    }
}

struct BackgroudView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
            startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 4) {
            Text(dayOfWeek)
            Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 40, height: 40)
            Text("\(temperature)°")
        }
        .foregroundColor(.white)
        .font(.system(size: 28, weight: .regular, design: .default))
    }
}

#Preview {
    ContentView()
}
