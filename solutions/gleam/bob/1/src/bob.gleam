import gleam/string
import gleam/list
import gleam/result
import gleam/io

pub fn hey(remark: String) -> String {
  let is_question = remark |> string.trim |> string.ends_with("?")
  let has_letters = remark |> is_alpha
  let is_yelling = has_letters && remark |> string.uppercase == remark
  let is_empty = remark |> string.trim == ""
  echo is_yelling
  case is_question, is_yelling, is_empty {
    True, True, _ -> "Calm down, I know what I'm doing!"
    True, _, _ -> "Sure."
    _, True, _ -> "Whoa, chill out!" 
    _, _, True -> "Fine. Be that way!"
    _, _, _ -> "Whatever."
  }
}

fn is_alpha(phrase: String) -> Bool {
  phrase
  |> string.to_graphemes
  |> list.any(fn(ch: String) -> Bool {is_letter(ch)})
}

fn is_letter(char: String) -> Bool {
  let boundaries = [
    #("a", "z"),
    #("A", "Z")
  ]

  boundaries
  |> list.any(fn(boundary) {
    let #(start, end) = boundary
    char_code(start) <= char_code(char) && char_code(char) <= char_code(end)
}
)
}

fn char_code(char: String) -> Int {
  char
  |> string.to_utf_codepoints
  |> list.first
  |> result.map(string.utf_codepoint_to_int) 
  |> result.unwrap(-1)                       
}