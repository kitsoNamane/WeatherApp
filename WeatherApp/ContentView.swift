//
//  ContentView.swift
//  WeatherApp
//
//  Created by Kitso Namane on 09/09/23.
//

import SwiftUI

struct ContentView: View {

    @State private var isNight = false

    var body: some View {
        ZStack {
            BackgroudView(isNight: isNight)
            VStack(alignment: .center) {
                CityTextView(cityName: "Cupertino, CA")
                CityWeatherStatus(weatherSymbol: "cloud.sun.fill", temperature: 76)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", weatherSymbol: "sun.max.fill", temperature: 74)
                    
                    WeatherDayView(dayOfWeek: "WED", weatherSymbol: "cloud.sun.fill", temperature: 78)
                    
                    WeatherDayView(dayOfWeek: "THU", weatherSymbol: "cloud.rain.fill", temperature: 64)
                    
                    WeatherDayView(dayOfWeek: "FRI", weatherSymbol: "cloud.hail.fill", temperature: 50)
                    
                    WeatherDayView(dayOfWeek: "SAT", weatherSymbol: "cloud.snow.fill", temperature: 44)
                }
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                   WeatherButton(title: "Change Day Time", textColor: .blue, backgroudColor: .white)
                }
                Spacer()
            }
        }
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
         Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct CityWeatherStatus: View {
    var weatherSymbol: String
    var temperature: Int
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: weatherSymbol)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroudColor: Color
    var body: some View {
         Text(title)
            .frame(width: 280, height: 50)
            .background(backgroudColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
            .foregroundColor(textColor)
    }
}

struct BackgroudView: View {
    var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
            startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var weatherSymbol: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 4) {
            Text(dayOfWeek)
            Image(systemName: weatherSymbol)
                .symbolRenderingMode(.palette)
                .resizable()
                .foregroundStyle(.pink, .orange, .green)
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
