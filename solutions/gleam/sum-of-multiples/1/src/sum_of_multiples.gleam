import gleam/int
import gleam/list

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  list.range(from: 0, to: limit - 1)
  |> list.filter(keeping: fn(x) {list.any(in: factors, satisfying: fn(factor) {factor > 0 && x % factor == 0})})
  |> int.sum
}
