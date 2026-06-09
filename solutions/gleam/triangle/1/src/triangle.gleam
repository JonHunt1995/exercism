import gleam/list
import gleam/float
import gleam/result

pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  a == b && b == c && c >. 0.0
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  meets_inequality([a, b, c]) && unique_side_lengths([a, b, c]) <= 2
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  meets_inequality([a, b, c]) && unique_side_lengths([a, b, c]) == 3
}

fn meets_inequality(sides: List(Float)) -> Bool {
  let max = sides
    |> list.max(float.compare)
    |> result.unwrap(-1.0)

  let perimeter = sides |> float.sum

  max >. 0.0 && {perimeter -. max} >. max 
}

fn unique_side_lengths(sides: List(Float)) -> Int {
  sides
    |> list.unique
    |> list.length
}
