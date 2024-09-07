////

import gleam/io
import gleam/list
import gleam/string
import gleam/string_builder

///
pub fn transcribe(dna_seq: String) -> String {
  string.replace(dna_seq, each: "T", with: "U")
}

///
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

///
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
