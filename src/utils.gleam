////

import gleam/io

///
pub type Base {
  A
  T
  G
  C
  U
  N
}

///
pub fn parse_bases(sequence: List(String), bases: List(Base)) {
  case sequence {
    [] -> bases
    [first, ..rest] ->
      case first {
        "A" | "a" -> parse_bases(rest, [A, ..bases])
        "T" | "t" -> parse_bases(rest, [T, ..bases])
        "C" | "c" -> parse_bases(rest, [C, ..bases])
        "G" | "g" -> parse_bases(rest, [G, ..bases])
        "U" | "u" -> parse_bases(rest, [U, ..bases])
        "N" | "n" -> parse_bases(rest, [N, ..bases])
        _ -> {
          io.println(
            "Unknown/unsupported base encountered: "
            <> first
            <> ". Skipping to next base.",
          )
          parse_bases(rest, bases)
        }
      }
  }
}
