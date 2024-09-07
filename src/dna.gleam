////

import utils

///
pub type NucleotideCounts {
  NucleotideCounts(a: Int, t: Int, g: Int, c: Int, u: Int, n: Int)
}

///
pub fn count_bases(sequence: List(utils.Base), counts: NucleotideCounts) {
  case sequence {
    [] -> counts
    [first, ..rest] -> {
      let new_tallies = case first {
        utils.A -> NucleotideCounts(..counts, a: counts.a + 1)
        utils.T -> NucleotideCounts(..counts, t: counts.t + 1)
        utils.G -> NucleotideCounts(..counts, g: counts.g + 1)
        utils.C -> NucleotideCounts(..counts, c: counts.c + 1)
        utils.U -> NucleotideCounts(..counts, u: counts.u + 1)
        utils.N -> NucleotideCounts(..counts, n: counts.n + 1)
      }
      count_bases(rest, new_tallies)
    }
  }
}
