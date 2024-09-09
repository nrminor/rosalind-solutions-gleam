//// Problem
//// In DNA strings, symbols 'A' and 'T' are complements of each other, as are 'C' and 'G'.
////
//// The reverse complement of a DNA string s is the string sc formed by reversing the symbols of s, then taking the complement of each symbol (e.g., the reverse complement of "GTCA" is "TGAC").
////
//// Given: A DNA string s of length at most 1000 bp.
////
//// Return: The reverse complement sc of s.
////

import utils.{type Base, A, C, G, N, T, U}

/// Reverse complementing is relatively easy with FP-style recursion and linked-lists
/// because prepending to lists, which will naturally reverse the order of a list, is
/// convention. This function uses simple pattern matching on `Base`-type variants to
/// return the reverse complement of a list of DNA bases.
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
