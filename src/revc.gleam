////

import utils.{type Base, A, C, G, N, T, U}

///
pub fn reverse_comp(rev: List(Base), seq: List(Base)) -> List(Base) {
  case seq {
    [] -> rev
    [first, ..rest] ->
      case first {
        A -> reverse_comp([T, ..rev], rest)
        T -> reverse_comp([A, ..rev], rest)
        G -> reverse_comp([C, ..rev], rest)
        C -> reverse_comp([G, ..rev], rest)
        U -> reverse_comp([A, ..rev], rest)
        N -> reverse_comp([N, ..rev], rest)
      }
  }
}
