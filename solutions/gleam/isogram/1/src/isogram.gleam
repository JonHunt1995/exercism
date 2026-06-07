import gleam/dict
import gleam/list
import gleam/option.{None, Some}
import gleam/string

pub fn is_isogram(phrase phrase: String) -> Bool {
  let letter_counts =
    phrase
    |> string.lowercase
    |> string.to_graphemes
    |> list.filter(fn(grapheme) { grapheme != " " && grapheme != "-" })
    |> list.fold(from: dict.new(), with: fn(acc, grapheme) {
      dict.upsert(acc, grapheme, fn(x) {
        case x {
          Some(i) -> i + 1
          None -> 1
        }
      })
    })

  letter_counts
  |> dict.values
  |> list.all(fn(val) { val == 1 })
}