import gleam/list
import gleam/int

pub fn convert(number: Int) -> String {
  case [3, 5, 7] |> list.map(fn(x) { number % x}) {
    [0, 0, 0] -> "PlingPlangPlong"
    [0, _, 0] -> "PlingPlong"
    [0, 0, _] -> "PlingPlang"
    [_, 0, 0] -> "PlangPlong"
    [_, _, 0] -> "Plong"
    [_, 0, _] -> "Plang"
    [0, _, _] -> "Pling"
    _ -> int.to_string(number)
  }
}
