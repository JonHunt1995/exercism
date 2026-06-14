import gleam/list
import gleam/string

pub fn first_letter(name: String) {
  case name |> string.trim |> string.first {
    Ok(letter) -> letter
    Error(_) -> ""
  }
}

pub fn initial(name: String) {
  name 
  |> first_letter
  |> string.uppercase
  <> "."
}

pub fn initials(full_name: String) {
  full_name
  |> string.split(on: " ")
  |> list.map(initial)
  |> string.join(" ")
}

pub fn pair(full_name1: String, full_name2: String) {
  [top_half(), format_pair(full_name1, full_name2), bottom_half()]
  |> string.join("\n") 
}

fn top_half() -> String {
  "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **"
}

fn format_pair(full_name1: String, full_name2: String) -> String {
  "**     " <> initials(full_name1) <> "  +  " <> initials(full_name2) <> "     **"
}

fn bottom_half() -> String {
  " **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
}