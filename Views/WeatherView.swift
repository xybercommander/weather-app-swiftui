//
//  WeatherView.swift
//  weather-app
//
//  Created by Samrat Mukherjee on 01/10/23.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 60)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "sun.haze")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 90))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    AsyncImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/clear-social-c2910.appspot.com/o/city-landscape-illustration_11823-1643-removebg-preview.png?alt=media&token=94bb4fbe-3851-497f-82bb-8b35557d3a5a&_gl=1*1jiio5c*_ga*MTI5MTc1NjYzMC4xNjkxNjYzMDM5*_ga_CW55HF8NVT*MTY5NjE0MDMzMS4yLjEuMTY5NjE0MDcwOC41NS4wLjA.")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 350)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: "\(weather.main.tempMin.roundDouble())°")
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: "\(weather.main.tempMax.roundDouble())°")
                            .padding(.trailing, 5)
                    }
                    
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind Speed", value: "\(weather.wind.speed.roundDouble()) km/h")
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity)%")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.698, saturation: 0.684, brightness: 0.3))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color(hue: 0.698, saturation: 0.684, brightness: 0.3))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    WeatherView(weather: previewWeather)
}
