//// Problem
//// An RNA string is a string formed from the alphabet containing 'A', 'C', 'G', and 'U'.
////
//// Given a DNA string t
////  corresponding to a coding strand, its transcribed RNA string u
////  is formed by replacing all occurrences of 'T' in t
////  with 'U' in u
//// .
////
//// Given: A DNA string t
////  having length at most 1000 nt.
////
//// Return: The transcribed RNA string of t.

import gleam/io
import gleam/list
import gleam/string
import gleam/string_builder

/// Take a string of DNA base characters and use the string standard library module's
/// replace function to replace T's with U's, thereby transcribing the DNA into correct
/// RNA with a succinct one-liner.
pub fn transcribe(dna_seq: String) -> String {
  string.replace(dna_seq, each: "T", with: "U")
}

/// DNA-to-RNA transcription can also be performed using iteration in a Gleam pipeline,
/// which is demonstrated in this function with the `string.to_graphemes` function, a
/// map that replaces T's with U's, and a conversion back into a single string. This
/// approach is heavy on allocation, but demonstrates interesting and arguably
/// beautiful Gleam syntax.
pub fn pipeline_transcribe(dna_seq: String) -> String {
  dna_seq
  |> string.to_graphemes
  |> list.map(fn(base) {
    case base {
      "T" -> "U"
      _ -> base
    }
  })
  |> string_builder.from_strings
  |> string_builder.to_string
}

/// `recursive_transcribe` transcribes DNA to RNA, yet again with a different
/// approach than the other two functions in this module, this time using Gleam's
/// advanced string pattern matching capabilities.
/// Like how Gleam (and other ML-languages) allows you to split off the first item of
/// a list and match on it, so too does it allow you to split off the first character/
/// grapheme in a list and match on it. Here, that approach is used to recursively
/// traverse a list and accumulate the final string.
pub fn recursive_transcribe(dna_seq: String, acc: String) {
  case dna_seq {
    "A" <> rest -> recursive_transcribe(rest, acc <> "A")
    "T" <> rest -> recursive_transcribe(rest, acc <> "U")
    "G" <> rest -> recursive_transcribe(rest, acc <> "G")
    "C" <> rest -> recursive_transcribe(rest, acc <> "C")
    "U" <> rest -> recursive_transcribe(rest, acc <> "U")
    "N" <> rest -> recursive_transcribe(rest, acc <> "N")
    "" -> Ok(acc)
    _ -> {
      let message =
        "Unknown/unsupported base encountered in the provided DNA string:\n"
        <> dna_seq
        <> "\nAborting."
      io.println_error(message)
      Error(message)
    }
  }
}
