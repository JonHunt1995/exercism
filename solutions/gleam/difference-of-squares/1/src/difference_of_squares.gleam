pub fn square_of_sum(n: Int) -> Int {
  sum_of_sequence(n) * sum_of_sequence(n)
}

fn sum_of_sequence(n: Int) -> Int {
  case n {
    i if i <= 1 -> i
    _ -> n + sum_of_sequence(n - 1)
  }
}

pub fn sum_of_squares(n: Int) -> Int {
  case n {
    i if i <= 0 -> i
    _ -> {n*n} + sum_of_squares(n - 1)
  }
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
