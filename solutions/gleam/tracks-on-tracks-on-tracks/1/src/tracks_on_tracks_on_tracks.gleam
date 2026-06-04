import gleam/list

pub fn new_list() -> List(String) {
  []
}

pub fn existing_list() -> List(String) {
  ["Gleam", "Go", "TypeScript"]
}

pub fn add_language(languages: List(String), language: String) -> List(String) {
  [language, ..languages]
}

pub fn count_languages(languages: List(String)) -> Int {
  case languages {
    [] -> 0
    [first, ..rest] -> 1 + count_languages(rest)
  }
}

pub fn reverse_list(languages: List(String)) -> List(String) {
  languages |> list.reverse
}

pub fn exciting_list(languages: List(String)) -> Bool {
  case languages {
    ["Gleam", ..] -> True
    [_, _, _, _, ..] -> False
    [_, "Gleam", ..] -> True
    _ -> False
  }
}
