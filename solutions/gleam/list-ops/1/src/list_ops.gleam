pub fn append(first first: List(a), second second: List(a)) -> List(a) {
  first
  |> foldr(from: second, with: fn(acc,item) {[item, ..acc]})
}

pub fn concat(lists: List(List(a))) -> List(a) {
  lists
  |> foldl(from: [], with: fn(acc, item) {append(acc, item)})
}

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
  list
  |> foldr(from: [], with: fn(acc, item) {
    case function(item) {
      True -> [item, ..acc]
      False -> acc
    }
  })
}

pub fn length(list: List(a)) -> Int {
  list
  |> foldl(from: 0, with: fn(acc, item) {acc + 1})
}

pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
  list
  |> foldr(from: [], with: fn(acc, item) {[function(item), ..acc]})
}

pub fn foldl(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  case list {
    [] -> initial
    [first, ..rest] -> foldl(over: rest, from: function(initial, first), with: function)
  }
}

pub fn foldr(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  foldl(over: reverse(list), from: initial, with: function)
}

pub fn reverse(list: List(a)) -> List(a) {
  list
  |> foldl(from: [], with: fn(acc, item) {[item, ..acc]})
}
