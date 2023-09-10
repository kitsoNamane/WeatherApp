//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Kitso Namane on 10/09/23.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroudColor: Color
    var body: some View {
         Text(title)
            .frame(width: 280, height: 50)
            .background(backgroudColor.gradient)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
            .foregroundColor(textColor)
    }
}
