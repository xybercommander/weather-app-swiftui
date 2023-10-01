//
//  ContentView.swift
//  weather-app
//
//  Created by Samrat Mukherjee on 30/09/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
//                Text("Your coordinates are: \(location.longitude), \(location.latitude)")
                if let weather = weather {
//                    Text("Weather data fetched \(String(describing: weather))")
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task { // task adds an asynchronous code
                            do {
                                weather = try await weatherManager
                                    .getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
                        
        }
        .background(Color(hue: 0.698, saturation: 0.684, brightness: 0.3))
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
