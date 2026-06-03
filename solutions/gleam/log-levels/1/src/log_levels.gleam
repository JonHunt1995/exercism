import gleam/string

pub fn message(log_line: String) -> String {
case string.split_once(log_line, on: "]:") {
  Ok(#(level, message)) -> {
    message
    |> string.trim() 
}
  Error(_) -> ""
  }
}

pub fn log_level(log_line: String) -> String {
  case string.split_once(log_line, on: "]:") {
  Ok(#(level, message)) -> {
    level 
    |> string.trim() 
    |> string.drop_start(up_to: 1)
    |> string.lowercase()
}
  Error(_) -> ""
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}
