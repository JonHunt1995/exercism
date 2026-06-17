pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza {
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(p) -> pizza_price(p) + 1
    ExtraToppings(p) -> pizza_price(p) + 2
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  order_price_helper(order: order, total: 0)
}

fn order_price_helper(order order: List(Pizza), total total: Int) -> Int {
  case order, total {
    [], total -> total
    [first], 0 -> pizza_price(first) + 3
    [first, second], 0 -> pizza_price(first) + pizza_price(second) + 2
    [first, ..rest], total -> order_price_helper(order: rest, total: total + pizza_price(first))
  }
}
