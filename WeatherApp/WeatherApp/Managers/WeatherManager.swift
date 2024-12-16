//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Валера Шавлягин on 16.12.2024.
//

import Foundation
import CoreLocation

class WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherData {

        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=YOUR_API_CODE_&units=metric") else {
            throw URLError(.badURL)
        }

        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decodedData = try JSONDecoder().decode(WeatherData.self, from: data)
        
        return decodedData
    }
}
