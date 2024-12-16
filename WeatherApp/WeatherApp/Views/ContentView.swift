//
//  ContentView.swift
//  WeatherApp
//
//  Created by Валера Шавлягин on 16.12.2024.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    @State var weatherData: WeatherData?
    let weatherManager = WeatherManager()
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let weatherData = weatherData {
                    // islooding true
                    WeatherView(weatherData: weatherData)
                } else {
                    // false
                    LoadingView()
                        .task {
                            do {
                                weatherData = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error while get weather: \(error)")
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
        .background(Color(red: 0.0157, green: 0.1019, blue: 0.1843))
        .preferredColorScheme(.dark)
    }
    
  
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
