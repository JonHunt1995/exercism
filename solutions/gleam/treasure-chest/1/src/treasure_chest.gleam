pub type TreasureChest(a) {
  TreasureChest(password: String, item: a)
}

pub type UnlockResult(a) {
  Unlocked(a)
  WrongPassword
}

pub fn get_treasure(
  chest: TreasureChest(treasure),
  password: String,
) -> UnlockResult(treasure) {
  let TreasureChest(secret, item) = chest
  case secret == password {
    True -> Unlocked(item)
    False -> WrongPassword
  }
}
