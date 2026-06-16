import gleam/list
import gleam/dict
import gleam/result
import gleam/string

pub fn is_paired(value: String) -> Bool {
  let matches = [#("(", ")"), #("[", "]"), #("{", "}")]
  |> dict.from_list
  let stack = []
  let letters = value |> string.to_graphemes

  valid_braces(matches: matches, stack: stack, letters: letters)
}

fn valid_braces(matches matches: dict.Dict(String, String), stack stack: List(String), letters letters: List(String)) -> Bool {
  case stack, letters {
    _, [] -> stack |> list.is_empty
    [], [next, ..rest] -> case next {
      "}" | "]" | ")" -> False
      "(" | "{" | "[" -> valid_braces(matches: matches, stack: [next], letters: rest)
      _ -> valid_braces(matches: matches, stack: stack, letters: rest)
    }
    [top, ..bottom], [next, ..rest] -> case top, next, matches |> dict.get(top) |> result.unwrap("") == next {
      _, "[", _ | _, "(", _ | _, "{", _ -> valid_braces(matches: matches, stack: [next, ..stack], letters: rest)
      "[",_,True | "(",_,True | "{", _, True -> valid_braces(matches: matches, stack: bottom, letters: rest)
      _, "]", False | _, "}", False | _,")", False -> False
      _, _, _ -> valid_braces(matches: matches, stack: stack, letters: rest)
    }
  }
}


