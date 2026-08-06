## ADDED Requirements

### Requirement: Every door answers `--help` and rejects an unknown option

Asking `emit` what it does SHALL succeed. `--help` and `-h` SHALL be accepted at the top level and
in every verb's option loop, SHALL print usage, and SHALL exit with a success status. They SHALL NOT
be reported as an unknown verb or an unknown option.

At the top level, `--help` SHALL print the summary of verbs and shared flags. For a verb,
`emit <verb> --help` SHALL print that verb's own usage — its argument form, the options it accepts,
and the shared options — so that every verb can be asked what it takes.

`emit help` SHALL be accepted as a spelling of the same request: bare, it SHALL print the top-level
summary; with a verb, `emit help <verb>` SHALL print exactly what `emit <verb> --help` prints. Named
with something that is not a verb, it SHALL be reported and SHALL exit non-zero, like any other
unknown verb.

**Destination follows why the text was printed.** Usage printed *because it was requested* is the
output the user asked for and SHALL go to standard output, so it can be piped or paged without
redirection. Usage printed *as part of an error* SHALL remain on standard error alongside the
diagnostic, and the process SHALL exit non-zero as it does today (missing verb, unknown verb,
unknown option).

**Every door SHALL reject an unknown option**, naming the door and the option, and exit non-zero. No
door SHALL silently ignore an option it does not recognize — a mistyped flag that changes nothing
and reports nothing is indistinguishable from one that worked.

#### Scenario: Top-level help succeeds

- **WHEN** `emit --help` (or `emit -h`) is run
- **THEN** the usage summary is printed on standard output and the process exits zero, with no
  `unknown verb` diagnostic

#### Scenario: A verb reports its own usage

- **WHEN** `emit run --help` is run, and likewise for `repl`, `build`, and `lib`
- **THEN** that verb's usage — its argument form and the options it accepts — is printed on standard
  output and the process exits zero

#### Scenario: `emit help` is the same request spelled as a word

- **WHEN** `emit help` is run, and separately `emit help <verb>`
- **THEN** the first prints the top-level summary and the second prints that verb's own usage, both
  on standard output with a zero exit; and **WHEN** `emit help` names something that is not a verb,
- **THEN** it is reported on standard error and the process exits non-zero

#### Scenario: Usage after an error stays on standard error

- **WHEN** `emit` is run with no verb, or with a verb it does not recognize
- **THEN** the diagnostic and the usage summary are printed on standard error and the process exits
  non-zero, as before

#### Scenario: An unknown option is rejected by every door

- **WHEN** any of `emit run`, `emit repl`, `emit build`, or `emit lib` is given an option it does not
  recognize
- **THEN** it reports the door and the offending option and exits non-zero, rather than ignoring the
  option and proceeding
