//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Валера Шавлягин on 16.12.2024.
//

import SwiftUI

struct WeatherView: View {
    var weatherData: WeatherData
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weatherData.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: weatherData.weather.first?.icon.systemIconName ?? "cloud")
                                .font(.system(size: 40))
                            
                            Text(weatherData.weather.first?.description ?? "No description")
                                .font(.headline)
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text("\(weatherData.main.temp.roundDouble())°")
                            .font(.system(size: 100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height: 80)
                    
                    Image("city")
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .padding(.bottom,20)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .bold()
                        .padding(.bottom)
                        
                    
                    HStack {
                        Image(systemName: "thermometer.low")
                            .font(.title2)
                        VStack(alignment: .leading) {
                            Text("Min temp")
                                .font(.caption)
                            Text("\(weatherData.main.temp_min.roundDouble())°")
                                .bold()
                                .font(.title)
                        }
                        Spacer()
                        Image(systemName: "thermometer.high")
                            .font(.title2)
                        VStack(alignment: .leading) {
                            Text("Max temp")
                                .font(.caption)
                            Text("\(weatherData.main.temp_max.roundDouble())°")
                                .bold()
                                .font(.title)
                        }
                    }
                    
                    HStack {
                        Image(systemName: "wind")
                            .font(.title2)
                        VStack(alignment: .leading) {
                            Text("Wind speed")
                                .font(.caption)
                            Text("\(weatherData.wind.speed.roundDouble()) m/s")
                                .bold()
                                .font(.title)
                        }
                        Spacer()
                        Image(systemName: "humidity")
                            .font(.title2)
                        VStack(alignment: .leading) {
                            Text("Humidity")
                                .font(.caption)
                            Text("\(weatherData.main.humidity)%")
                                .bold()
                                .font(.title)
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(red: 0.0157, green: 0.1019, blue: 0.1843))
                .background(.white)
                .cornerRadius(20)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(red: 0.0157, green: 0.1019, blue: 0.1843))
        .preferredColorScheme(.dark)
    }
}

extension Double {
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}

extension String {
    var systemIconName: String {
        switch self {
        case "01d": return "sun.max.fill"
        case "01n": return "moon.fill"
        case "02d": return "cloud.sun.fill"
        case "02n": return "cloud.moon.fill"
        case "03d", "03n": return "cloud.fill"
        case "04d", "04n": return "cloud.fill"
        case "09d", "09n": return "cloud.rain.fill"
        case "10d": return "cloud.sun.rain.fill"
        case "10n": return "cloud.moon.rain.fill"
        case "11d", "11n": return "cloud.bolt.fill"
        case "13d", "13n": return "snow"
        case "50d", "50n": return "cloud.fog.fill"
        default: return "questionmark.circle"
        }
    }
}


