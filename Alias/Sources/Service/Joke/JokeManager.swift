//
//  JokeManager.swift
//  Alias
//
//  Created by Андрей Кузнецов on 29.07.2022.
//
import Foundation

protocol JokeManagerDelegate {
    func didGetJoke(jokeModel: JokeModel)
    func didFailWithError(error: Error)
}

struct JokeManager {
    
    let apiKey = "https://joke.deno.dev"
    
    var delegate: JokeManagerDelegate?
    
    func fetchData() {
        guard let url = URL(string: apiKey) else { return }
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: url) { data, _, error in
            if let error = error {
                self.delegate?.didFailWithError(error: error)
                return
            }
            
            if let data = data {
                if let jokeModel = parseJSON(data) {
                    self.delegate?.didGetJoke(jokeModel: jokeModel)
                }
            }
        }
        task.resume()
    }
    
    func parseJSON(_ jokeData: Data) -> JokeModel? {
        let decoder = JSONDecoder()
        do {
            let jokeData = try decoder.decode(JokeData.self, from: jokeData)
            return JokeModel(text: jokeData.setup, answer: jokeData.punchline)
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
