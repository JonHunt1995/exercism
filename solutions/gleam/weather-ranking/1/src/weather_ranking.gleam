import gleam/order.{type Order}
import gleam/list
import gleam/float

pub type City {
  City(name: String, temperature: Temperature)
}

pub type Temperature {
  Celsius(Float)
  Fahrenheit(Float)
}

pub fn fahrenheit_to_celsius(f: Float) -> Float {
  {f -. 32.0} /. 1.8
}

pub fn compare_temperature(left: Temperature, right: Temperature) -> Order {
  case left, right {
    Celsius(left_temp), Celsius(right_temp) -> float.compare(left_temp, right_temp)
    Fahrenheit(left_temp), Fahrenheit(right_temp) -> float.compare(left_temp, right_temp)
    Celsius(left_temp), Fahrenheit(right_temp) -> float.compare(left_temp, fahrenheit_to_celsius(right_temp))
    Fahrenheit(left_temp), Celsius(right_temp) -> float.compare(fahrenheit_to_celsius(left_temp), right_temp)
  }
}

fn compare_city_temperature(left: City, right: City) -> Order {
  compare_temperature(left.temperature, right.temperature)
}

pub fn sort_cities_by_temperature(cities: List(City)) -> List(City) {
  cities
  |> list.sort(by: compare_city_temperature)
}
