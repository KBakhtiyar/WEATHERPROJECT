import Foundation

class NetworkManager {
   
    static let shared = NetworkManager()
   
    func getWeatherData(completion: @escaping (WeatherData?) -> Void) {
        let url = URL(string: "https://goweather.herokuapp.com/weather/Astana")!
        
        let manager = URLSession.shared

            manager.dataTask(with: url) { data, response, error in
                
                if let error = error {
                    print(error)
                    completion(nil)
                    return
                }
                guard let data = data else {
                    completion(nil)
                    return
                }
                
                let decoder = JSONDecoder()
                do {
                    let weatherData = try decoder.decode(WeatherData.self, from: data)
                    completion(weatherData)

                } catch(let error) {
                    print(error)
                    completion(nil)
                    return
                }
                
            }.resume()
    }
    
}

struct WeatherData: Codable {
    
    var temperature: String?
    var wind: String?
    var description: String?
    var id: Int?
}
    
        


