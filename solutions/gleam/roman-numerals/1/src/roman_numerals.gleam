import gleam/list
import gleam/result

pub fn convert(number: Int) -> String {
  let nums = [1000,900,500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
  let letters = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  let #(num, letter) = list.zip(nums, letters)
    |> list.find(one_that: fn(x) {number >= x.0})
    |> result.unwrap(or: #(0, ""))

  case number {
    0 -> ""
    _ -> letter <> convert(number - num)
  }
}