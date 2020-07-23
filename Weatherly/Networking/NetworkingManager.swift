//
//  NetworkingManager.swift
//  Weatherly
//
//  Created by Ivan Kulundzic on 31/05/2020.
//  Copyright © 2020 Ivan Kulundzic. All rights reserved.
//

import Foundation

final class NetworkingManager {
  func getApiData<T: Codable>(url: URL, completion: @escaping (T) -> Void) {
    let request = URLRequest(url: url)
    URLSession.shared.dataTask(with: request) { data, response, error in
      DispatchQueue.main.async {
        if let error = error {
          print("Failed to get data from url: ", error)
          return
        }
        guard let data = data else { return }
        do {
          let object: T = try JsonParser().parseJson(data: data)
          //print("Object1: ", object)
          completion(object)
        } catch {
          print("Error parsing JSON: ", error)
        }
      }
    }.resume()
  }
}
