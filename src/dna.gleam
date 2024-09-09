//// Problem
//// a string is simply an ordered collection of symbols selected from some alphabet and formed into a word; the length of a string is the number of symbols that it contains.
////
//// an example of a length 21 dna string (whose alphabet contains the symbols 'a', 'c', 'g', and 't') is "atgcttcagaaaggtcttacg."
////
//// given: a dna string s of length at most 1000 nt.
////
//// return: four integers (separated by spaces) counting the respective number of times that the symbols 'a', 'c', 'g', and 't' occur in s.

import utils

/// `NucleotideCounts` stores integer counts for each supported kind of nucleotide in
/// the provided string of nucleotides.
pub type NucleotideCounts {
  NucleotideCounts(a: Int, t: Int, g: Int, c: Int, u: Int, n: Int)
}

/// `count_bases` iterates recursively through a string of parsed base values and
/// uses Gleam update syntax to increment up counts of each supported base.
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
