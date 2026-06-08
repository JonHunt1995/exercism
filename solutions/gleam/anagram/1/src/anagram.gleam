import gleam/list
import gleam/string

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  candidates
  |> list.filter(fn(candidate) { are_anagrams(word, candidate)})
}

fn are_anagrams(target: String, candidate: String) -> Bool {
  let are_different = target |> string.lowercase != candidate |> string.lowercase
  let match_letters = [target, candidate]
  |> list.map(fn(word) {
    word
    |> string.lowercase
    |> string.to_graphemes
    |> list.sort(by: string.compare)
  })
   |> list.unique
   |> list.length == 1
   
  are_different && match_letters
}