//
//  City.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 31/05/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation

struct City: Codable {
  let name: String
  let latitude: Float
  let longitude: Float
  let currentWeather: CurrentWeatherData
  let dailyWeather: DailyWeather
  let flags: Flags
  
  init(name: String, latitude: Float, longitude: Float, currentWeather: CurrentWeatherData, dailyWeather: DailyWeather, flags: Flags) {
    self.name = name
    self.latitude = latitude
    self.longitude = longitude
    self.currentWeather = currentWeather
    self.dailyWeather = dailyWeather
    self.flags = flags
  }
  
  enum CodingKeys: String, CodingKey {
    case name = "timezone"
    case latitude = "latitude"
    case longitude = "longitude"
    case currentWeather = "currently"
    case dailyWeather = "daily"
    case flags = "flags"
  }
}

struct CurrentWeatherData: Codable {
  let time: Int
  let summary: String
  let temperature: Double
  let windSpeed: Double
  let humidity: Double
  let pressure: Double
  let icon: Icon
  
  enum Icon: String, Codable {
    case clearDay = "clear-day"
    case clearNight = "clear-night"
    case rain = "rain"
    case snow = "snow"
    case sleet = "sleet"
    case wind = "wind"
    case fog = "fog"
    case cloudy = "cloudy"
    case partlyCloudyDay = "partly-cloudy-day"
    case partlyCloudyNight = "partly-cloudy-night"
  }
  
  enum CodingKeys: String, CodingKey {
    case time = "time"
    case summary = "summary"
    case temperature = "temperature"
    case windSpeed = "windSpeed"
    case humidity = "humidity"
    case pressure = "pressure"
    case icon = "icon"
  }
}

struct DailyWeather: Codable {
  let data: [DailyData]
  
  enum CodingKeys: String, CodingKey {
    case data = "data"
  }
}

struct DailyData: Codable {
  let time: Int
  let temperatureMin: Float
  let temperatureMax: Float
  
  enum CodingKeys: String, CodingKey {
    case time = "time"
    case temperatureMin = "temperatureMin"
    case temperatureMax = "temperatureMax"
  }
}

struct Flags: Codable {
  let units: String
}

