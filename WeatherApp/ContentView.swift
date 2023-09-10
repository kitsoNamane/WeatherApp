//
//  ContentView.swift
//  WeatherApp
//
//  Created by Kitso Namane on 09/09/23.
//

import SwiftUI

struct ContentView: View {

    @State private var isNight = false
    
    private var weatherForNextFiveDays = [
        Weather(dayOfWeek: "MON", weatherSymbol: "sun.max.fill", temperature: 74),
        Weather(dayOfWeek: "TUE", weatherSymbol: "cloud.sun.fill", temperature: 78),
        Weather(dayOfWeek: "WED", weatherSymbol: "cloud.rain.fill", temperature: 64),
        Weather(dayOfWeek: "THU", weatherSymbol: "cloud.hail.fill", temperature: 50),
        Weather(dayOfWeek: "FRI", weatherSymbol: "cloud.snow.fill", temperature: 44),
    ]

    var body: some View {
        ZStack {
            BackgroudView(isNight: isNight)
            VStack(alignment: .center) {
                CityTextView(cityName: "Cupertino, CA")
                CityWeatherStatus(weatherSymbol: "cloud.sun.fill", temperature: 76)
                
                HStack(spacing: 20) {
                    ForEach(weatherForNextFiveDays) { weather in
                        WeatherDayView(dayOfWeek: weather.dayOfWeek, weatherSymbol: weather.weatherSymbol, temperature: weather.temperature)
                    }
                    
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

struct Weather: Identifiable {
    var dayOfWeek: String
    var weatherSymbol: String
    var temperature: Int
    var id: String { dayOfWeek }
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
                .symbolRenderingMode(.multicolor)
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
