import UIKit

protocol Subject {
    func registerObserver(observer: Observer)
    func removeObserver(observer: Observer)
    func notifyObservers()
}

protocol Observer {
    func update(temp: Float, windSpeed: Float, pressure: Float)
}

class WeatherData: Subject {
    private var observers: [Observer]  = []
    private var temp: Float = 0.0
    private var windSpeed: Float = 0.0
    private var pressure: Float = 0.0

    func registerObserver(observer: Observer) {
        observers.append(observer)
    }

    func removeObserver(observer: Observer) {
        if let index = observers.lastIndex(where: { (observer) -> Bool in
            return true
        }) {
            observers.remove(at: index)
        }
    }

    func notifyObservers() {
        for observer in observers {
            observer.update(temp: temp, windSpeed: windSpeed, pressure: pressure)
        }
    }

    func setMeasurements(temp: Float, windSpeed: Float, pressure: Float) {
        self.temp = temp
        self.windSpeed = windSpeed
        self.pressure = pressure
        notifyObservers()
    }
}

class UserInterface: Observer {
    private let weatherData: WeatherData

    init(weatherData: WeatherData) {
        self.weatherData = weatherData
    }

    func update(temp: Float, windSpeed: Float, pressure: Float) {
        display(temp: temp, windSpeed: windSpeed, pressure: pressure)
    }

    private func display(temp: Float, windSpeed: Float, pressure: Float) {
        print("User Interface: Temp: \(temp)")
        print("User Interface: WindSpeed: \(windSpeed)")
        print("User Interface: Pressure: \(pressure)")
    }
}

class Logger: Observer {
    private let weatherData: WeatherData

    init(weatherData: WeatherData) {
        self.weatherData = weatherData
    }

    func update(temp: Float, windSpeed: Float, pressure: Float) {
        log(temp: temp, windSpeed: windSpeed, pressure: pressure)
    }

    private func log(temp: Float, windSpeed: Float, pressure: Float) {
        print("Logger: Temp: \(temp)")
        print("Logger: WindSpeed: \(windSpeed)")
        print("Logger: Pressure: \(pressure)")
    }
}

class Alert: Observer {
    private let weatherData: WeatherData

    init(weatherData: WeatherData) {
        self.weatherData = weatherData
    }

    func update(temp: Float, windSpeed: Float, pressure: Float) {
        alert(temp: temp, windSpeed: windSpeed, pressure: pressure)
    }

    private func alert(temp: Float, windSpeed: Float, pressure: Float) {
        print("Alert: Temp: \(temp)")
        print("Alert: WindSpeed: \(windSpeed)")
        print("Alert: Pressure: \(pressure)")
    }
}

let weatherData = WeatherData()
let userInterface = UserInterface(weatherData: weatherData)
let logger = Logger(weatherData: weatherData)
let alert = Alert(weatherData: weatherData)

weatherData.registerObserver(observer: userInterface)
weatherData.registerObserver(observer: logger)
weatherData.registerObserver(observer: alert)

weatherData.setMeasurements(temp: 50.0, windSpeed: 200.0, pressure: 20.0)

weatherData.removeObserver(observer: alert)

weatherData.setMeasurements(temp: 50.0, windSpeed: 200.0, pressure: 20.0)
